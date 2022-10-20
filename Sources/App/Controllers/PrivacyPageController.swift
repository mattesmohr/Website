import Vapor

// [/privacy]
final class PrivacyPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("IndexView", EmptyContext(
            view: ViewMetadata(title: "Privacy"),
            route: RouteMetadata(route: route)))
    }
}

extension PrivacyPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("privacy", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
