import Vapor

// [/impressum]
final class ImpressumPageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return ImpressumPageTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Impressum"),
                route: RouteMetadata(route: route)),
            for: request)
    }
}

extension ImpressumPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("impressum", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
