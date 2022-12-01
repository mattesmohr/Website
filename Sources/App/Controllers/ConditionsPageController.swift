import Vapor

// [/conditions]
final class ConditionsPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("App.ConditionPage.IndexView", EmptyContext(
            view: ViewMetadata(title: "Conditions"),
            route: RouteMetadata(route: route)))
    }
}

extension ConditionsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("conditions", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
