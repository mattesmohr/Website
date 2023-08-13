import HTMLKitVapor
import Vapor

// [/settings]
final class SettingsPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let viewModel = SettingPageModel.IndexView()
        
        return try await request.htmlkit.render(SettingPage.IndexView(viewModel: viewModel))
    }
}

extension SettingsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("settings") { routes in
            
            routes.get("index", use: self.getIndex)
        }
    }
}
    
