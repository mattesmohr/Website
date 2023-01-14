import HTMLKitVapor
import Vapor

// [/home]
final class HomePageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let context = EmptyContext(
            view: ViewMetadata(title: "Home"),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(HomePage.IndexView(context: context))
    }
}

extension HomePageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
