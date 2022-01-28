import Vapor

// [/articles]
final class ArticlesPageController {
    
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
                
                return ArticlePageTemplate.IndexView()
                    .render(with: IndexContext(
                        view: ViewMetadata(title: "Show entities"),
                        items: entities,
                        identity: IdentityMetadata(user: user),
                        route: RouteMetadata(route: route)),
                    for: request)
            }
            .flatMap { view in
                return view
            }
    }
    
    // [/show]
    func getShow(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        return ArticleRepository(database: request.db)
            .find(id: id)
            .unwrap(or: Abort(.notFound))
            .flatMap { entity in
            
                let model = ArticleModel.Output(entity: entity)
                
                return request.view.render("/articles/show", model)
            }
    }
}

extension ArticlesPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("articles", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("show", ":id", use: self.getShow)
        })
    }
}
    
