import HTMLKitVapor
import Vapor

// [/privacy]
final class PrivacyPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let context = EmptyContext(
            view: ViewMetadata(title: "Privacy"),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(PrivacyPage.IndexView(context: context))
    }
}

extension PrivacyPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("privacy", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
