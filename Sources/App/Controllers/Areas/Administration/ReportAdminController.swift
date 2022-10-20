import Vapor
import Fluent

// [/area/admin/reports]
final class ReportAdminController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
            
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return request.view.render("IndexView", EmptyContext(
            view: ViewMetadata(title: "Show reports"),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)))
    }
}

extension ReportAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("reports", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
