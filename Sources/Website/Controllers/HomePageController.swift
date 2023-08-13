import HTMLKitVapor
import Vapor

// [/home]
final class HomePageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = HomePageModel.IndexView()
        
        return try await request.htmlkit.render(HomePage.IndexView(viewModel: viewModel))
    }
}

extension HomePageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
