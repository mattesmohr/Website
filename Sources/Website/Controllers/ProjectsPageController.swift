import HTMLKitVapor
import Vapor

// [/projects]
final class ProjectsPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let projects = try await ProjectRepository(database: request.db)
            .find()
            .map(ProjectModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = ProjectPageModel.IndexView(pagination: projects)
        
        return try await request.htmlkit.render(ProjectPage.IndexView(viewModel: viewModel))
    }

    // [/show/:id]
    func getShow(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await ProjectRepository(database: request.db)
            .find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = ProjectPageModel.ShowView(project: ProjectModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ProjectPage.ShowView(viewModel: viewModel))
    }
}

extension ProjectsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("projects") { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("show", ":id", use: self.getShow)
        }
    }
}
