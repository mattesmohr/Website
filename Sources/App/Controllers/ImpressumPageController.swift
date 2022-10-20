import Vapor

// [/impressum]
final class ImpressumPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("IndexView", EmptyContext(
            view: ViewMetadata(title: "Impressum"),
            route: RouteMetadata(route: route)))
    }
}

extension ImpressumPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("impressum", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
