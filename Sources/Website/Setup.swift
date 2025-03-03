import Fluent
import FluentMySQLDriver
import Foundation
import HTMLKitVapor
import Vapor
import Logging
import NIOCore
import NIOPosix

@main
enum Setup {
    
    static func main() async throws {
        
        var environment = try Environment.detect()
        
        try LoggingSystem.bootstrap(from: &environment)
        
        let application = try await Application.make(environment)
        
        application.passwords.use(.bcrypt)
        application.sessions.use(.fluent(.mysql))
        
        do {
    
            try await middlwares(application)
            try await routes(application)
            try await tables(application)
            try await services(application)
            
            try await application.execute()
            
        } catch {
            
            application.logger.report(error: error)
            
            try? await application.asyncShutdown()
            
            throw error
        }
        
        try await application.asyncShutdown()
    }
    
    static func middlwares(_ application: Application) async throws {
        
        application.middleware = .init()
        application.middleware.use(RouteLoggingMiddleware(logLevel: .info))
        application.middleware.use(ErrorMiddleware())
        application.middleware.use(FileMiddleware(publicDirectory: application.directory.publicDirectory))
        application.middleware.use(application.sessions.middleware)
    }
    
    static func routes(_ application: Application) async throws {
        
        application.routes.defaultMaxBodySize = "10mb";
        
        let tracked = application.routes.grouped(PageRequestTracker())
        
        try tracked.register(collection: HomePageController())
        try tracked.register(collection: ArticlesPageController())
        try tracked.register(collection: ProjectsPageController())
        try tracked.register(collection: FeedPageController())
        try tracked.register(collection: PrivacyPageController())
        try tracked.register(collection: LegalPageController())
        
        try application.group("area") { routes in
        
            try routes.register(collection: LoginAreaController())
            
            try routes.group("admin") { routes in
                
                let restricted = routes.grouped(UserSessionAuthenticator(), UserModel.Output.redirectMiddleware(path: "/area/login"))
            
                try restricted.register(collection: HomeAdminController())
                try restricted.register(collection: ProjectAdminController())
                try restricted.register(collection: ArticleAdminController())
                try restricted.register(collection: AssetAdminController())
                try restricted.register(collection: UserAdminController())
                try restricted.register(collection: FeedAdminController())
                try restricted.register(collection: ReportAdminController())
                try restricted.register(collection: SettingAdminController())
            }
        }
        
    }
    
    static func tables(_ application: Application) async throws {
        
        var tls = TLSConfiguration.makeClientConfiguration()
        tls.certificateVerification = .none
        
        application.databases.use(.mysql(
            hostname: Environment.get("DB_HOSTNAME")!,
            username: Environment.get("DB_USERNAME")!,
            password: Environment.get("DB_PASSWORD")!,
            database: Environment.get("DB")!,
            tlsConfiguration: tls
        ), as: .mysql)
        
        application.migrations.add(SessionRecord.migration)
        application.migrations.add(AssetMigration())
        application.migrations.add(CredentialMigration())
        application.migrations.add(UserMigration())
        application.migrations.add(ArticleMigration())
        application.migrations.add(ProjectMigration())
        application.migrations.add(CommentMigration())
        application.migrations.add(ArticleAssetMigration())
        application.migrations.add(ProjectAssetMigration())
        application.migrations.add(ContactMigration())
        application.migrations.add(ReportMigration())
        application.migrations.add(FeedMigration())
        application.migrations.add(SettingMigration())
        
        try await application.autoMigrate()
    }
    
    static func services(_ application: Application) async throws {
        
        guard let localeSourcePath = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            throw Abort(.internalServerError)
        }
        
        application.htmlkit.localization.set(source: localeSourcePath)
        application.htmlkit.localization.set(locale: "en-GB")
        application.htmlkit.features = [.markdown]
    }
}
