import Foundation
import Vapor
import Fluent
import FluentMySQLDriver
import HTMLKit

public func configure(_ app: Application) throws {
    
    app.logger.info("Server enter \(app.environment.name)")
    
    app.http.server.configuration.hostname = "localhost"
    app.http.server.configuration.port = 8080
    
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(app.sessions.middleware)
    
    app.sessions.use(.memory)
    
    app.passwords.use(.bcrypt)

    try routes(app)
}
