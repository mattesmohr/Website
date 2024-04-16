import HTMLKitVapor
import Vapor

// [/feed]
final class FeedPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let feeds = try await FeedRepository(database: request.db)
            .find(status: "published")
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
