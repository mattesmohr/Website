import HTMLKitVapor
import Vapor

// [/area/login]
struct LoginAreaController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> Response {
        return request.redirect(to: "/area/login/login")
    }
    
    // [/login]
    @Sendable
    func getLogin(_ request: Request) async throws -> View {
        
        let viewModel = LoginAreaPageModel.LoginViewModel()
        
        return try await request.htmlkit.render(LoginAreaPage.LoginView(viewModel: viewModel))
    }
    
    // [/login/:model]
    @Sendable
    func postLogin(_ request: Request) async throws -> Response {
        
        try LoginModel.Input.validate(content: request)
        
        let model = try request.content.decode(LoginModel.Input.self)
        
        if let entity = try await CredentialRepository(database: request.db).find(name: model.username) {
            
            switch entity.status {
            case "locked", "deactivated", "new":
                // Do nothing yet...
                break
                
            default:
                
                if try await request.password.async.verify(model.password, created: entity.password) {
                    // The attempt was successfull, lets reset the counter...
                    if entity.attempt > 0 {
                        // Reset the counter...
                        try await CredentialRepository(database: request.db)
                            .patch(field: \.$attempt, to: 0, for: entity.requireID())
                    }
                    
                    if let entity = try await UserRepository(database: request.db).find(name: model.username) {
                        request.session.authenticate(UserModel.Output(entity: entity))
                    }
                    
                    return request.redirect(to: "/area/admin/home")
                    
                } else {
                    // Count the attempt. If it reached the limit, lock up the account...
                    if entity.attempt < 4 {
                        // Increment the attempt...
                        try await CredentialRepository(database: request.db)
                            .patch(field: \.$attempt, to: (entity.attempt + 1), for: entity.requireID())
                        
                    } else {
                        // Otherwise set the status to lock up the account...
                        try await CredentialRepository(database: request.db)
                            .patch(field: \.$status, to: "locked", for: entity.requireID())
                    }
                }
            }
        }
        
        return request.redirect(to: "/area/login/login")
    }
    
    // [/logout]
    @Sendable
    func getLogout(_ request: Request) async throws -> Response {
        
        request.auth.logout(UserModel.Output.self)
        request.session.unauthenticate(UserModel.Output.self)
        
        return request.redirect(to: "/area/login")
    }
}

extension LoginAreaController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("login") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get("login", use: self.getLogin)
            routes.post("login", use: self.postLogin)
            routes.get("logout", use: self.getLogout)
        }
    }
}
