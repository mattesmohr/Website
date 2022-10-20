import Vapor

struct UserSessionAuthenticator: AsyncSessionAuthenticator {
    
    typealias User = App.UserModel.Output
    
    func authenticate(sessionID: String, for request: Request) async throws {
    
        if let entity = try await UserRepository(database: request.db).find(name: sessionID) {
            
            request.auth.login(UserModel.Output(entity: entity))
        }
    }
}
