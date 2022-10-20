import Vapor
import Fluent

// [/area/admin/users]
final class UserAdminController {
    
    // [/index/:id]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return UserRepository(database: request.db)
            .page(index: id, with: 10)
            .mapEach(UserModel.Output.init)
            .flatMap { entities in
                
                return request.view.render("IndexView", IndexContext(
                    view: ViewMetadata(title: "Show users"),
                    items: entities,
                    identity: IdentityMetadata(user: user),
                    route: RouteMetadata(route: route)))
            }
    }
    
    // [/create]
    func getCreate(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return request.view.render("CreateView", CreateContext(
            view: ViewMetadata(title: "Create user"),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try UserModel.Input.validate(content: request)
        
        let model = try request.content.decode(UserModel.Input.self)
        
        return UserRepository(database: request.db)
            .insert(entity: UserEntity(input: model))
            .map { _ in
                return request.redirect(to: "/area/admin/users/index/0")
            }
    }
    
    // [/edit/:id]
    func getEdit(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return UserRepository(database: request.db)
            .find(id: id)
            .unwrap(or: Abort(.notFound))
            .flatMap { entity in
                
                let model = UserModel(
                    
                    output: UserModel.Output(entity: entity)
                )
                
                return request.view.render("EditView", EditContext(
                    view: ViewMetadata(title: "Edit user"),
                    item: model,
                    identity: IdentityMetadata(user: user),
                    route: RouteMetadata(route: route)))
            }
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try UserModel.Input.validate(content: request)
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        let model = try request.content.decode(UserModel.Input.self)
        
        return UserRepository(database: request.db)
            .update(entity: UserEntity(input: model), on: id)
            .map { _ in
                return request.redirect(to: "/area/admin/users/index/0")
            }
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) throws -> EventLoopFuture<Response> {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        return UserRepository(database: request.db)
            .delete(id: id)
            .map { _ in
                return request.redirect(to: "/area/admin/users/index/0")
            }
    }
}

extension UserAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("users", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        })
    }
}
