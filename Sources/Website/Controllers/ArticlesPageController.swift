import HTMLKitVapor
import Vapor

// [/articles]
final class ArticlesPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let articles = try await ArticleRepository(database: request.db)
            .find()
            .map(ArticleModel.Output.init)
            .page(page: page, per: 10)
        
        
        let viewModel = ArticlePageModel.IndexView(pagination: articles)
        
        return try await request.htmlkit.render(ArticlePage.IndexView(viewModel: viewModel))
    }
    
    // [/show]
    func getShow(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await ArticleRepository(database: request.db)
            .find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = ArticlePageModel.ShowView(article: ArticleModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ArticlePage.ShowView(viewModel: viewModel))
    }
}

extension ArticlesPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("articles") { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("show", ":id", use: self.getShow)
        }
    }
}
    
