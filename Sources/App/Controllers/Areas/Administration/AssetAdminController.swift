import Vapor
import Fluent

// [/area/admin/assets]
final class AssetAdminController {
    
    // [/index/:id]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        let entities = try await AssetRepository(database: request.db)
            .page(index: id, with: 10)
            .map(AssetModel.Output.init)
        
        return try await request.view.render("IndexView", IndexContext(
            view: ViewMetadata(title: "Show assets"),
            items: entities,
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)))
    }
    
    // [/create]
    func getCreate(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return try await request.view.render("CreateView", CreateContext(
            view: ViewMetadata(title: "Create asset"),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) async throws -> Response {
        
        try AssetModel.Input.validate(content: request)
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        try await AssetRepository(database: request.db)
            .insert(entity: AssetEntity(input: model))
        
        return request.redirect(to: "/area/admin/assets/index/0")
    }
    
    // [/edit/:id]
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        guard let entity = try await AssetRepository(database: request.db).find(id: id) else {
            throw Abort(.notFound)
        }
        
        return try await request.view.render("EditView", EditContext(
            view: ViewMetadata(title: "Edit asset"),
            item: entity,
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)))
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) async throws -> Response {
        
        try AssetModel.Input.validate(content: request)
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        try await AssetRepository(database: request.db)
            .update(entity: AssetEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/assets/index/0")
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await AssetRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/assets/index/0")
    }
}

extension AssetAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("assets", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        })
    }
}
