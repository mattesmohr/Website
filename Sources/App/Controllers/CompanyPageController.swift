import Vapor

// [/company]
final class CompanyPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return try await request.view.render("IndexView", EmptyContext(
            view: ViewMetadata(title: "Company"),
            route: RouteMetadata(route: route)))
    }
}

extension CompanyPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("company", configure: { routes in
            
            routes.get("index", use: self.getIndex)
        })
    }
}
    
