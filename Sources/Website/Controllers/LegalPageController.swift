import HTMLKitVapor
import Vapor

// [/legal]
struct LegalPageController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = LegalPageModel.IndexView()
        
        return try await request.htmlkit.render(LegalPage.IndexView(viewModel: viewModel))
    }
}

extension LegalPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("legal") { routes in
            
            routes.get("", use: self.getIndex)
        }
    }
}
    
