import HTMLKitVapor
import Vapor

// [/area/login]
final class LoginAreaController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> Response {        
        return request.redirect(to: "/area/login/login")
    }
    
    // [/login]
    func getLogin(_ request: Request) async throws -> View {
        
        let viewModel = LoginAreaPageModel.LoginViewModel()
        
        return try await request.htmlkit.render(LoginAreaPage.LoginView(viewModel: viewModel))
    }
    
    // [/login/:model]
    func postLogin(_ request: Request) async throws -> Response {
        
        try LoginModel.Input.validate(content: request)
        
        let model = try request.content.decode(LoginModel.Input.self)
        
        if let entity = try await UserRepository(database: request.db).find(name: model.email) {

            if try await request.password.async.verify(model.password, created: entity.credential!.password) {
            
                request.session.authenticate(UserModel.Output(entity: entity))
        
                return request.redirect(to: "/area/admin/home/index")
            }
        }
        
        return request.redirect(to: "/area/login/login")
    }
    
    // [/logout]
    func getLogout(_ request: Request) async throws -> Response {
        
        request.auth.logout(UserModel.Output.self)
        request.session.unauthenticate(UserModel.Output.self)
        
        return request.redirect(to: "/area/login/index")
    }
}

extension LoginAreaController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("login") { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("login", use: self.getLogin)
            routes.post("login", use: self.postLogin)
            routes.get("logout", use: self.getLogout)
        }
    }
}
