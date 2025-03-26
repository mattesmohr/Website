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
        
        // Create form token and store it to verify it in the post request
        request.application.htmlkit.environment.upsert(Nonce(), for: \Nonce.self)
        
        let viewModel = ArticlePageModel.ShowView(article: ArticleModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ArticlePage.ShowView(viewModel: viewModel))
    }
    
    // [/:slug/:modal]
    @Sendable
    func postShow(_ request: Request) async throws -> Response {
        
        guard let slug = request.parameters.get("slug", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.article.find(slug: slug) else {
            throw Abort(.notFound)
        }
        
        try CommentModel.Input.Public.validate(content: request)
        
        var model = try request.content.decode(CommentModel.Input.Public.self)
        
        guard let nonce = request.application.htmlkit.environment.retrieve(for: \Nonce.self) as? Nonce else {
            throw Abort(.internalServerError)
        }
        
        try nonce.verify(nonce: model.nonce)
        
        try await request.unit.comment.insert(entity: CommentEntity(input: model, on: entity.requireID()))
        
        return request.redirect(to: "/articles/\(slug)")
    }

}

extension ArticlesPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("articles") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get(":slug", use: self.getShow)
            routes.post(":slug", use: self.postShow)
        }
    }
}
    
