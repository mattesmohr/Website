import Vapor

// [/home]
final class HomePageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return HomePageTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Home"),
                route: RouteMetadata(route: route)),
            for: request)
    }
}

extension HomePageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
