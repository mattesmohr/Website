import HTMLKitVapor
import Vapor

// [/home]
struct HomePageController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        guard let pagination = try await request.unit.project.find(status: "published")
            .map(ProjectModel.Output.init)
            .page(at: 1, per: 10) else {
            
            throw Abort(.notFound)
        }
        
        let viewModel = HomePageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(HomePage.IndexView(viewModel: viewModel))
    }
}

extension HomePageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("home") { routes in
            
            routes.get("", use: self.getIndex)
        }
    }
}
