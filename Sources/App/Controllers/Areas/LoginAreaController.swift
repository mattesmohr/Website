import Vapor

// [/area/login]
final class LoginAreaController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> Response {        
        return request.redirect(to: "/area/login/login")
    }
    
    // [/register]
    func getRegister(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("RegisterView", CreateContext(
            view: ViewMetadata(title: "Register account"),
            route: RouteMetadata(route: route)))
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
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("LoginView", EmptyContext(
            view: ViewMetadata(title: "Register account"),
            route: RouteMetadata(route: route)))
    }
    
    // [/login/:model]
    func postLogin(_ request: Request) async throws -> Response {
        
        try LoginModel.Input.validate(content: request)
        
        let model = try request.content.decode(LoginModel.Input.self)
        
        guard let entity = try await UserRepository(database: request.db).find(name: model.email) else {
            return request.redirect(to: "/area/login/login")
        }
        
        if try! request.password.verify(model.password, created: entity.credential!.password) {
        
            let model = UserModel.Output(entity: entity)
        
            request.session.authenticate(model)
    
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
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("ResetView", CreateContext(
            view: ViewMetadata(title: "Reset"),
            route: RouteMetadata(route: route)))
    }
    
    // [/reset/:model]
    func postReset(_ request: Request) async throws -> Response {
        return request.redirect(to: "/area/login/login")
    }
}

extension LoginAreaController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("login", configure: { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("register", use: self.getRegister)
            routes.post("register", use: self.postRegister)
            routes.get("login", use: self.getLogin)
            routes.post("login", use: self.postLogin)
            routes.get("logout", use: self.getLogout)
            routes.get("reset", use: self.getReset)
            routes.post("reset", use: self.postReset)
        })
    }
}
