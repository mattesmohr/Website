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
        
        let executorTakeoverSuccess = NIOSingletons.unsafeTryInstallSingletonPosixEventLoopGroupAsConcurrencyGlobalExecutor()
        
        application.logger.debug("Running with \(executorTakeoverSuccess ? "SwiftNIO" : "standard") Swift Concurrency default executor")
        
        application.passwords.use(.bcrypt)
        application.sessions.use(.fluent(.mysql))
        
        do {
    
            try await middlwares(application)
            try await routes(application)
            try await tables(application)
            try await services(application)
            
        } catch {
            
            application.logger.report(error: error)
            
            try? await application.asyncShutdown()
            
            throw error
        }
        
        try await application.execute()
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
        
        try application.register(collection: HomePageController())
        try application.register(collection: ArticlesPageController())
        try application.register(collection: ProjectsPageController())
        try application.register(collection: FeedPageController())
        try application.register(collection: PrivacyPageController())
        try application.register(collection: LegalPageController())
        
        try application.group("area") { routes in
        
            try routes.register(collection: LoginAreaController())
            
            try routes.group("admin") { routes in
                
                let group = routes.grouped(UserSessionAuthenticator(), UserModel.Output.redirectMiddleware(path: "/area/login"))
            
                try group.register(collection: HomeAdminController())
                try group.register(collection: ProjectAdminController())
                try group.register(collection: ArticleAdminController())
                try group.register(collection: AssetAdminController())
                try group.register(collection: UserAdminController())
                try group.register(collection: FeedAdminController())
                try group.register(collection: ReportAdminController())
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
