import Fluent
import FluentMySQLDriver
import Foundation
import HTMLKitVapor
import Vapor

public func configure(_ app: Application) throws {
    
    app.logger.info("Server enter \(app.environment.name)")
    
    app.http.server.configuration.hostname = "localhost"
    app.http.server.configuration.port = 8080
    
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(app.sessions.middleware)
    
    app.sessions.use(.memory)
    
    app.passwords.use(.bcrypt)

    app.views.use(.htmlkit)
    
    app.htmlkit.views.add(view: HomePage.IndexView())
    
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none
    
    app.databases.use(.mysql(
        hostname: Environment.get("DB_HOSTNAME")!,
        username: Environment.get("DB_USERNAME")!,
        password: Environment.get("DB_PASSWORD")!,
        database: Environment.get("DB")!,
        tlsConfiguration: tls
    ), as: .mysql)
    
    app.migrations.add(AssetMigration())
    app.migrations.add(CredentialMigration())
    app.migrations.add(UserMigration())
    app.migrations.add(ArticleMigration())
    app.migrations.add(ProjectMigration())
    app.migrations.add(CommentMigration())
    app.migrations.add(ArticleAssetMigration())
    app.migrations.add(ProjectAssetMigration())
    app.migrations.add(ContactMigration())
    app.migrations.add(ReportMigration())
    app.migrations.add(LinkMigration())
    
    try app.autoMigrate().wait()

    try routes(app)
}
