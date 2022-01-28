import Vapor
import Fluent

// [/area/admin/home]
final class HomeAdminController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return HomeAdminTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Home"),
                identity: IdentityMetadata(user: user),
                route: RouteMetadata(route: route)),
            for: request)
    }
}

extension HomeAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
