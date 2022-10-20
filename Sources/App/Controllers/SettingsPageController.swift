import Vapor

// [/settings]
final class SettingsPageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return request.view.render("IndexView", EmptyContext(
            view: ViewMetadata(title: "Settings"),
            route: RouteMetadata(route: route)))
    }
}

extension SettingsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("settings", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
