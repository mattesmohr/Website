import HTMLKitVapor
import Vapor

// [/feed]
final class FeedPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        return try await request.htmlkit.render(FeedPage.IndexView(viewModel: .init()))
    }
}

extension FeedPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("feed") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
