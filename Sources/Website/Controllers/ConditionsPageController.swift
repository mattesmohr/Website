import HTMLKitVapor
import Vapor

// [/conditions]
final class ConditionsPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = ConditionPageModel.IndexView()
        
        return try await request.htmlkit.render(ConditionPage.IndexView(viewModel: viewModel))
    }
}

extension ConditionsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("conditions") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
    
