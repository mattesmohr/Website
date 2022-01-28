import Vapor

// [/company]
final class CompanyPageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return CompanyPageTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Company"),
                route: RouteMetadata(route: route)),
            for: request)
    }
}

extension CompanyPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("company", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
