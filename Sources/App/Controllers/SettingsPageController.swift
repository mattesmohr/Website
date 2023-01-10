import HTMLKitVapor
import Vapor

// [/settings]
final class SettingsPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let context = EmptyContext(
            view: ViewMetadata(title: "Settings"),
            route: RouteMetadata(route: route)
        )
        
        return try await request.htmlkit.render(SettingPage.IndexView(context: context))
    }
}

extension SettingsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("settings", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
