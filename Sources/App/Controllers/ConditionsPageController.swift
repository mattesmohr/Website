import Vapor

// [/conditions]
final class ConditionsPageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return ConditionPageTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Conditions"),
                route: RouteMetadata(route: route)),
            for: request)
    }
}

extension ConditionsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("conditions", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
