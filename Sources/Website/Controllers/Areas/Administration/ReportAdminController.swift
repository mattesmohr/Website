import HTMLKitVapor
import Vapor

// [/area/admin/reports]
final class ReportAdminController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
            
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        let context = EmptyContext(
            view: ViewMetadata(title: "Show reports"),
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(ReportAdminPage.IndexView(context: context))
    }
}

extension ReportAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("reports", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
