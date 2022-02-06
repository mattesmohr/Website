import Vapor

struct UserSessionAuthenticator: SessionAuthenticator {
    
    typealias User = App.UserModel.Output
    
    func authenticate(sessionID: String, for request: Request) -> EventLoopFuture<Void> {
    
        return UserRepository(database: request.db)
            .find(name: sessionID)
            .unwrap(or: Abort(.notFound))
            .flatMap { entity in
            
            let model = UserModel.Output(entity: entity)
            
            request.auth.login(model)
                
            return request.eventLoop.makeSucceededFuture(())
        }
    }
}
