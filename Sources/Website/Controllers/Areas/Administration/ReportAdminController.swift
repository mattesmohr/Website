import HTMLKitVapor
import Vapor

// [/area/admin/reports]
final class ReportAdminController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = ReportAdminPageModel.IndexView()
        
        return try await request.htmlkit.render(ReportAdminPage.IndexView(viewModel: viewModel))
    }
}

extension ReportAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("reports") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
