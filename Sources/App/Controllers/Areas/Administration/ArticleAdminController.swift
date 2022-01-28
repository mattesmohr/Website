import Vapor
import Fluent

// [/area/admin/article]
final class ArticleAdminController {

    // [/index/:id]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return ArticleRepository(database: request.db)
            .page(index: id, with: 10)
            .mapEach(ArticleModel.Output.init)
            .flatMapThrowing { entities in
                
                return ArticleAdminTemplate.IndexView()
                    .render(with: IndexContext(
                        view: ViewMetadata(title: "Article"),
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
        
        let model = ArticleModel(
            categories: ["iOS", "macOS", "padOS"],
            states: ["published", "draft", "archived"]
        )
        
        return request.view.render("/area/admin/article/create", CreateContext(
            
            view: ViewMetadata(title: "Create entry"),
            item: model,
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)
        ))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try ArticleModel.Input.validate(content: request)
        
        var model = try request.content.decode(ArticleModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        return ArticleRepository(database: request.db)
            .insert(entity: ArticleEntity(input: model))
            .map { _ in
                return request.redirect(to: "/area/admin/article/index/0")
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
        
        return ArticleRepository(database: request.db)
            .find(id: id)
            .unwrap(or: Abort(.notFound))
            .flatMapThrowing { entity in
                
                let model = ArticleModel(
                    
                    output: ArticleModel.Output(entity: entity),
                    categories: ["iOS", "macOS", "padOS"],
                    states: ["published", "draft", "archived"]
                )
                
                return request.view.render("/area/admin/article/edit", EditContext(
                    view: ViewMetadata(title: "Edit entry"),
                    item: model,
                    identity: IdentityMetadata(user: user),
                    route: RouteMetadata(route: route)
                ))
            }
            .flatMap { view in
                return view
            }
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try ArticleModel.Input.validate(content: request)
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }

        var model = try request.content.decode(ArticleModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        return ArticleRepository(database: request.db)
            .update(entity: ArticleEntity(input: model), on: id)
            .map { _ in
                return request.redirect(to: "/area/admin/article/index/0")
            }
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) throws -> EventLoopFuture<Response> {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        return ArticleRepository(database: request.db)
            .delete(id: id)
            .map { _ in
                return request.redirect(to: "/area/admin/article/index/0")
            }
    }
}

extension ArticleAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("article", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        })
    }
}

