import Vapor

// [/articles]
final class ArticlesPageController {
    
    // [/index/:id]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return ArticleRepository(database: request.db)
            .page(index: id, with: 10)
            .mapEach(ArticleModel.Output.init)
            .flatMap { entities in
                
                return request.view.render("IndexView", IndexContext(
                    view: ViewMetadata(title: "Articles"),
                    items: entities,
                    route: RouteMetadata(route: route)))
            }
    }
    
    // [/show]
    func getShow(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return ArticleRepository(database: request.db)
            .find(id: id)
            .unwrap(or: Abort(.notFound))
            .flatMap { entity in
                
                return request.view.render("ShowView", ShowContext(
                    view: ViewMetadata(title: "Article"),
                    item: ArticleModel.Output(entity: entity),
                    route: RouteMetadata(route: route)))
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
    
