import Vapor
import Fluent

// [/area/login]
final class LoginAreaController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<Response> {
        
        let redirect = request.redirect(to: "/area/login/login")
        
        return request.eventLoop.future(redirect)
    }
    
    // [/register]
    func getRegister(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return request.view.render("/area/login/register", CreateContext(
            view: ViewMetadata(title: "Register account"),
            item: RegisterModel(),
            route: RouteMetadata(route: route)
        ))
    }
    
    // [/register/:model]
    func postRegister(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try RegisterModel.validate(content: request)
        
        let model = try request.content.decode(RegisterModel.self)
        
        let digest = try request.password.hash(model.password!)
        
        return CredentialRepository(database: request.db)
            .insert(entity: CredentialEntity(password: digest, role: .administrator, status: .unlocked), with: UserEntity(email: model.email!))
            .map { _ in
                return request.redirect(to: "/area/login/login")
            }
    }
    
    // [/login]
    func getLogin(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return LoginAreaTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Register account"),
                route: RouteMetadata(route: route)),
            for: request)
    }
    
    // [/login/:model]
    func postLogin(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try LoginModel.validate(content: request)
        
        let model = try request.content.decode(LoginModel.self)
        
        return UserRepository(database: request.db)
            .find(name: model.email!)
            .unwrap(or: Abort(.notFound))
            .map { entity in
                
                if try! request.password.verify(model.password!, created: entity.credential!.password) {
                
                    let model = UserModel.Output(entity: entity)
                
                    request.session.authenticate(model)
            
                    return request.redirect(to: "/area/admin/home/index")
                    
                } else {
                    
                    return request.redirect(to: "/area/login/login")
                }
            }
    }
    
    // [/logout]
    func getLogout(_ request: Request) throws -> EventLoopFuture<Response> {
        
        request.auth.logout(UserModel.Output.self)
        request.session.unauthenticate(UserModel.Output.self)
        
        let response = request.redirect(to: "/area/login/index")
        
        return request.eventLoop.future(response)
    }
    
    // [/reset]
    func getReset(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return request.view.render("/area/login/reset", CreateContext(
            view: ViewMetadata(title: "Reset password"),
            item: ResetModel(),
            route: RouteMetadata(route: route)
        ))
    }
    
    // [/reset/:model]
    func postReset(_ request: Request) throws -> EventLoopFuture<Response> {
        
        return request.eventLoop.future(request.redirect(to: "/area/login/login"))
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
