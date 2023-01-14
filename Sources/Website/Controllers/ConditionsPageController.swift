import HTMLKitVapor
import Vapor

// [/conditions]
final class ConditionsPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let context = EmptyContext(
            view: ViewMetadata(title: "Conditions"),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(ConditionPage.IndexView(context: context))
    }
}

extension ConditionsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("conditions", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
