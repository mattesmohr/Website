import HTMLKitVapor
import Vapor

// [/area/admin/users]
final class UserAdminController {
    
    // [/index/:id]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        let entities = try await UserRepository(database: request.db)
            .page(index: id, with: 10)
            .map(UserModel.Output.init)
        
        let context = IndexContext(
            view: ViewMetadata(title: "Show users"),
            items: entities,
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(UserAdminPage.IndexView(context: context))
    }
    
    // [/create]
    func getCreate(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        let context = CreateContext(
            view: ViewMetadata(title: "Create user"),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(UserAdminPage.CreateView(context: context))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) async throws -> Response {
        
        try UserModel.Input.validate(content: request)
        
        let model = try request.content.decode(UserModel.Input.self)
        
        try await UserRepository(database: request.db)
            .insert(entity: UserEntity(input: model))
        
        return request.redirect(to: "/area/admin/users/index/0")
    }
    
    // [/edit/:id]
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        guard let entity = try await UserRepository(database: request.db).find(id: id) else {
            throw Abort(.notFound)
        }
        
        let context = EditContext(
            view: ViewMetadata(title: "Edit user"),
            item: UserModel.Output(entity: entity),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(UserAdminPage.EditView(context: context))
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) async throws -> Response {
        
        try UserModel.Input.validate(content: request)
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        let model = try request.content.decode(UserModel.Input.self)
        
        try await UserRepository(database: request.db)
            .update(entity: UserEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/users/index/0")
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await UserRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/users/index/0")
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
