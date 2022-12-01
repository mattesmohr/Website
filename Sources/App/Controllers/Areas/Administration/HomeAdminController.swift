import Vapor

// [/area/admin/home]
final class HomeAdminController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return try await request.view.render("App.HomeAdminPage.IndexView", EmptyContext(
            view: ViewMetadata(title: "Show home"),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)))
    }
}

extension HomeAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
