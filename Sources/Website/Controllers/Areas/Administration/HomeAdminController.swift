import HTMLKitVapor
import Vapor

// [/area/admin/home]
final class HomeAdminController {
    
    // [/]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = HomeAdminPageModel.IndexView()
        
        return try await request.htmlkit.render(HomeAdminPage.IndexView(viewModel: viewModel))
    }
}

extension HomeAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home") { routes in
            
            routes.get("", use: self.getIndex)
        }
    }
}
