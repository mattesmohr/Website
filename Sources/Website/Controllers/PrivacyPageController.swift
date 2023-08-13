import HTMLKitVapor
import Vapor

// [/privacy]
final class PrivacyPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = PrivacyPageModel.IndexView()
        
        return try await request.htmlkit.render(PrivacyPage.IndexView(viewModel: viewModel))
    }
}

extension PrivacyPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("privacy") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
