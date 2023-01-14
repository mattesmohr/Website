import HTMLKitVapor
import Vapor

// [/impressum]
final class ImpressumPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let context = EmptyContext(
            view: ViewMetadata(title: "Impressum"),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(ImpressumPage.IndexView(context: context))
    }
}

extension ImpressumPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("impressum", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
