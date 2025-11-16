import HTMLKitVapor
import Vapor

// [/area/admin/reports]
struct ReportAdminController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let reports = try await request.unit.report.find()
        
        let models = reports.map(ReportModel.Output.init)
        
        let viewModel = ReportAdminPageModel.IndexView(reports: models)
        
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
