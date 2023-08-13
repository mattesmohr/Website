import HTMLKitVapor
import Vapor

// [/company]
final class CompanyPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = CompanyPageModel.IndexView()
        
        return try await request.htmlkit.render(CompanyPage.IndexView(viewModel: viewModel))
    }
}

extension CompanyPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("company") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
    
