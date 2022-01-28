import Vapor

// [/privacy]
final class PrivacyPageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return PrivacyPageTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Privacy"),
                route: RouteMetadata(route: route)),
            for: request)
    }
}

extension PrivacyPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("privacy", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
