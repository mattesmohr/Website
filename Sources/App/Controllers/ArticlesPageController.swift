import Vapor

// [/articles]
final class ArticlesPageController {
    
    // [/index/:id]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let entities = try await ArticleRepository(database: request.db)
            .page(index: id, with: 10)
            .map(ArticleModel.Output.init)
        
        return try await request.view.render("App.ArticlePage.IndexView", IndexContext(
            view: ViewMetadata(title: "Articles"),
            items: entities,
            route: RouteMetadata(route: route)))
    }
    
    // [/show]
    func getShow(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await ArticleRepository(database: request.db).find(id: id) else {
            throw Abort(.notFound)
        }
        
        return try await request.view.render("App.ArticlePage.ShowView", ShowContext(
            view: ViewMetadata(title: "Article"),
            item: ArticleModel.Output(entity: entity),
            route: RouteMetadata(route: route)))
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
    
