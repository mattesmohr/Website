import Vapor
import Fluent

// [/area/admin/asset]
final class AssetAdminController {
    
    // [/index/:id]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return AssetRepository(database: request.db)
            .page(index: id, with: 10)
            .mapEach(AssetModel.Output.init)
            .flatMapThrowing { entities in
                
                return AssetAdminTemplate.IndexView()
                    .render(with: IndexContext(
                        view: ViewMetadata(title: "Asset"),
                        items: entities,
                        identity: IdentityMetadata(user: user),
                        route: RouteMetadata(route: route)),
                    for: request)
            }
            .flatMap { view in
                return view
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
        
        return request.view.render("/area/admin/asset/create", CreateContext(
            view: ViewMetadata(title: "Create entry"),
            item: ArticleModel(),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)
        ))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try AssetModel.Input.validate(content: request)
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        return AssetRepository(database: request.db)
            .insert(entity: AssetEntity(input: model))
            .map { _ in
                return request.redirect(to: "/area/admin/asset/index/0")
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
        
        return AssetRepository(database: request.db)
            .find(id: id)
            .unwrap(or: Abort(.notFound))
            .flatMapThrowing { entity in
                
                return request.view.render("/area/admin/asset/edit", EditContext(
                    
                    view: ViewMetadata(title: "Edit entry"),
                    item: AssetModel.Output(entity: entity),
                    identity: IdentityMetadata(user: user),
                    route: RouteMetadata(route: route)
                ))
            }
            .flatMap { view in
                return view
            }
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try AssetModel.Input.validate(content: request)
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        return AssetRepository(database: request.db)
            .update(entity: AssetEntity(input: model), on: id)
            .map { _ in
                return request.redirect(to: "/area/admin/asset/index/0")
            }
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) throws -> EventLoopFuture<Response> {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        return AssetRepository(database: request.db)
            .delete(id: id)
            .map { _ in
                return request.redirect(to: "/area/admin/asset/index/0")
            }
    }
}

extension AssetAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("asset", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        })
    }
}
