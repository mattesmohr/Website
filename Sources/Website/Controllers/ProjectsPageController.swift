import HTMLKitVapor
import Vapor

// [/projects]
struct ProjectsPageController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let projects = try await request.unit.project.find(status: "published")
            .map(ProjectModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = ProjectPageModel.IndexView(pagination: projects)
        
        return try await request.htmlkit.render(ProjectPage.IndexView(viewModel: viewModel))
    }

    // [/:slug]
    @Sendable
    func getShow(_ request: Request) async throws -> View {
        
        guard let slug = request.parameters.get("slug", as: String.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.project.find(slug: slug) else {
            throw Abort(.notFound)
        }
        
        let viewModel = ProjectPageModel.ShowView(project: ProjectModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ProjectPage.ShowView(viewModel: viewModel))
    }
}

extension ProjectsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("projects") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get(":slug", use: self.getShow)
        }
    }
}
