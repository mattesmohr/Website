import HTMLKitVapor
import Vapor

// [/area/admin/reports]
struct ReportAdminController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let projects = try await request.unit.project.group(column: "category")
        
        let viewModel = ReportAdminPageModel.IndexView(projects: projects)
        
        return try await request.htmlkit.render(ReportAdminPage.IndexView(viewModel: viewModel))
    }
}

extension ReportAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("reports") { routes in
            
            routes.get("", use: self.getIndex)
        }
    }
}
