import HTMLKitVapor
import Vapor

// [/impressum]
final class ImpressumPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = ImpressumPageModel.IndexView()
        
        return try await request.htmlkit.render(ImpressumPage.IndexView(viewModel: viewModel))
    }
}

extension ImpressumPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("impressum") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
    
