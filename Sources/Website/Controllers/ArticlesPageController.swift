import HTMLKitVapor
import Vapor

// [/articles]
struct ArticlesPageController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let articles = try await request.unit.article.find(status: "published")
            .map(ArticleModel.Output.init)
            .page(page: page, per: 10)
        
        
        let viewModel = ArticlePageModel.IndexView(pagination: articles)
        
        return try await request.htmlkit.render(ArticlePage.IndexView(viewModel: viewModel))
    }
    
    // [/:slug]
    @Sendable
    func getShow(_ request: Request) async throws -> View {
        
        guard let slug = request.parameters.get("slug", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.article.find(slug: slug) else {
            throw Abort(.notFound)
        }
        
        let viewModel = ArticlePageModel.ShowView(article: ArticleModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ArticlePage.ShowView(viewModel: viewModel))
    }
}

extension ArticlesPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("articles") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get(":slug", use: self.getShow)
        }
    }
}
    
