import HTMLKitVapor
import Vapor

// [/area/login]
final class LoginAreaController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> Response {        
        return request.redirect(to: "/area/login/login")
    }
    
    // [/register]
    func getRegister(_ request: Request) async throws -> View {

        let viewModel = LoginAreaPageModel.RegisterViewModel()
        
        return try await request.htmlkit.render(LoginAreaPage.RegisterView(viewModel: viewModel))
    }
    
    // [/register/:model]
    func postRegister(_ request: Request) async throws -> Response {
        
        try RegisterModel.Input.validate(content: request)
        
        let model = try request.content.decode(RegisterModel.Input.self)
        
        let digest = try request.password.hash(model.password)
        
        try await CredentialRepository(database: request.db)
            .insert(entity: CredentialEntity(password: digest, role: CredentialModel.Roles.administrator.rawValue, status: CredentialModel.States.unlocked.rawValue), with: UserEntity(email: model.email))
        
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
        
        guard let entity = try await UserRepository(database: request.db).find(name: model.email) else {
            return request.redirect(to: "/area/login/login")
        }
        
        if try! request.password.verify(model.password, created: entity.credential!.password) {
        
            request.session.authenticate(UserModel.Output(entity: entity))
    
            return request.redirect(to: "/area/admin/home/index")
        }
        
        return request.redirect(to: "/area/login/login")
    }
    
    // [/logout]
    func getLogout(_ request: Request) async throws -> Response {
        
        request.auth.logout(UserModel.Output.self)
        request.session.unauthenticate(UserModel.Output.self)
        
        return request.redirect(to: "/area/login/index")
    }
    
    // [/reset]
    func getReset(_ request: Request) async throws -> View {
        
        let viewModel = LoginAreaPageModel.ResetViewModel()
        
        return try await request.htmlkit.render(LoginAreaPage.ResetView(viewModel: viewModel))
    }
    
    // [/reset/:model]
    func postReset(_ request: Request) async throws -> Response {
        return request.redirect(to: "/area/login/login")
    }
}

extension LoginAreaController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("login") { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("register", use: self.getRegister)
            routes.post("register", use: self.postRegister)
            routes.get("login", use: self.getLogin)
            routes.post("login", use: self.postLogin)
            routes.get("logout", use: self.getLogout)
            routes.get("reset", use: self.getReset)
            routes.post("reset", use: self.postReset)
        }
    }
}
