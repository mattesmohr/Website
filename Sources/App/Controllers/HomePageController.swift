import Vapor

// [/home]
final class HomePageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("App.HomePage.IndexView", EmptyContext(
            view: ViewMetadata(title: "Home"),
            route: RouteMetadata(route: route)))
    }
}

extension HomePageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
