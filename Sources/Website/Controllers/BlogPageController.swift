import HTMLKitVapor
import Vapor

// [/blog]
struct BlogPageController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        let limit: Int = request.query["limit"] ?? 10
        
        guard let pagination = try await request.unit.article.find(status: "published")
            .map(ArticleModel.Output.init)
            .page(at: page, per: limit) else {
            
            throw Abort(.notFound)
        }
        
        let viewModel = BlogPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(BlogPage.IndexView(viewModel: viewModel))
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
        
        let viewModel = BlogPageModel.ShowView(article: ArticleModel.Output(entity: entity))
        
        return try await request.htmlkit.render(BlogPage.ShowView(viewModel: viewModel))
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
        
        guard let nonce = request.application.htmlkit.environment.retrieve(for: \Nonce.self) as? Nonce else {
            throw Abort(.internalServerError)
        }
        
        try CommentModel.Input.Public.validate(content: request)
        
        let model = try request.content.decode(CommentModel.Input.Public.self)
        
        guard nonce.verify(nonce: model.nonce) else {
            throw Abort(.badRequest)
        }
        
        try await request.unit.comment.insert(entity: CommentEntity(input: model, on: entity.requireID()))
        
        return request.redirect(to: "/blog/\(slug)")
    }

}

extension BlogPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("blog") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get(":slug", use: self.getShow)
            routes.post(":slug", use: self.postShow)
        }
    }
}
    
