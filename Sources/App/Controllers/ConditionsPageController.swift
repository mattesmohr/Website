import Vapor

// [/conditions]
final class ConditionsPageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return request.view.render("IndexView", EmptyContext(
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
    
