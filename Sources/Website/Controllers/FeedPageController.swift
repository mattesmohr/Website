import HTMLKitVapor
import Vapor

// [/feed]
struct FeedPageController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        let limit: Int = request.query["limit"] ?? 10
        
        guard let pagination = try await request.unit.post.find(status: "published")
            .map(PostModel.Output.init)
            .page(at: page, per: limit) else {
            
            throw Abort(.badRequest)
        }
        
        let viewModel = FeedPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(FeedPage.IndexView(viewModel: viewModel))
    }
}

extension FeedPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("feed") { routes in
            
            routes.get("", use: self.getIndex)
        }
    }
}
