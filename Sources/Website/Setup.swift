import FluentMySQLDriver
import Foundation
import HTMLKitVapor
import Vapor

@main
struct Setup {
    
    static func main() throws {
        
        var environment = try Environment.detect()
        
        try LoggingSystem.bootstrap(from: &environment)
        
        let application = Application(environment)
        
        defer { application.shutdown() }
        
        application.middleware.use(FileMiddleware(publicDirectory: application.directory.publicDirectory))
        application.middleware.use(application.sessions.middleware)
        
        application.sessions.use(.memory)
        
        application.passwords.use(.bcrypt)
        
        var tls = TLSConfiguration.makeClientConfiguration()
        tls.certificateVerification = .none
        
        application.databases.use(.mysql(
            hostname: Environment.get("DB_HOSTNAME")!,
            username: Environment.get("DB_USERNAME")!,
            password: Environment.get("DB_PASSWORD")!,
            database: Environment.get("DB")!,
            tlsConfiguration: tls
        ), as: .mysql)
        
        try application.register(collection: HomePageController())
        try application.register(collection: ArticlesPageController())
        try application.register(collection: ProjectsPageController())
        try application.register(collection: FeedPageController())
        try application.register(collection: PrivacyPageController())
        try application.register(collection: ImpressumPageController())
        try application.register(collection: ConditionsPageController())
        
        try application.group("area") { routes in
        
            try routes.register(collection: LoginAreaController())
            
            try routes.group("admin") { routes in
                
                let group = routes.grouped(application.sessions.middleware, UserSessionAuthenticator(), UserModel.Output.redirectMiddleware(path: "/area/login/index"))
            
                try group.register(collection: HomeAdminController())
                try group.register(collection: ProjectAdminController())
                try group.register(collection: ArticleAdminController())
                try group.register(collection: AssetAdminController())
                try group.register(collection: UserAdminController())
                try group.register(collection: ReportAdminController())
            }
        }
        
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
        application.migrations.add(LinkMigration())
        
        try application.autoMigrate().wait()
        
        let localizationPath = application.directory.workingDirectory + "Sources/Website/Localization"
        
        application.htmlkit.localization.set(source: URL(string: localizationPath)!)
        application.htmlkit.localization.set(locale: "en-GB")
        
        try application.run()
    }
}
