import Vapor

/// A middleware responsible for authenticating user
struct UserSessionAuthenticator: AsyncSessionAuthenticator {
    
    typealias User = Website.UserModel.Output
    
    func authenticate(sessionID: String, for request: Request) async throws {
        
        if let entity = try await request.unit.user.find(email: sessionID) {
            
            let user = UserModel.Output(entity: entity)
            
            request.application.htmlkit.environment.upsert(user, for: \UserModel.Output.self)
            
            request.auth.login(user)
        }
    }
}
