import HTMLKitVapor
import Vapor

// [/feed]
struct FeedPageController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let feeds = try await request.unit.feed.find(status: "published")
            .map(FeedModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = FeedPageModel.IndexView(pagination: feeds)
        
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
