import FluentMySQLDriver
import Foundation
import HTMLKitVapor
import Vapor

@main
public struct Setup {
    
    public static func main() throws {
        
        var env = try Environment.detect()
        
        try LoggingSystem.bootstrap(from: &env)
        
        let app = Application(env)
        
        defer { app.shutdown() }
        
        app.http.server.configuration.hostname = "localhost"
        app.http.server.configuration.port = 8080
        
        app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
        app.middleware.use(app.sessions.middleware)
        
        app.sessions.use(.memory)
        
        app.passwords.use(.bcrypt)
        
        var tls = TLSConfiguration.makeClientConfiguration()
        tls.certificateVerification = .none
        
        app.databases.use(.mysql(
            hostname: Environment.get("DB_HOSTNAME")!,
            username: Environment.get("DB_USERNAME")!,
            password: Environment.get("DB_PASSWORD")!,
            database: Environment.get("DB")!,
            tlsConfiguration: tls
        ), as: .mysql)
        
        try app.register(collection: HomePageController())
        try app.register(collection: ArticlesPageController())
        try app.register(collection: ProjectsPageController())
        try app.register(collection: CompanyPageController())
        try app.register(collection: ConnectPageController())
        try app.register(collection: PrivacyPageController())
        try app.register(collection: SettingsPageController())
        try app.register(collection: ImpressumPageController())
        try app.register(collection: ConditionsPageController())
        
        try app.group("area") { routes in
        
            try routes.register(collection: LoginAreaController())
            
            try routes.group("admin") { routes in
                
                let group = routes.grouped(app.sessions.middleware, UserSessionAuthenticator(), UserModel.Output.redirectMiddleware(path: "/area/login/index"))
            
                try group.register(collection: HomeAdminController())
                try group.register(collection: ProjectAdminController())
                try group.register(collection: ArticleAdminController())
                try group.register(collection: AssetAdminController())
                try group.register(collection: UserAdminController())
                try group.register(collection: ReportAdminController())
            }
        }
        
        try app.run()
    }
}
