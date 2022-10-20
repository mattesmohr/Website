import Vapor

// [/projects]
final class ProjectsPageController {
    
    // [/index:/id]
    func getIndex(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let entities = try await ProjectRepository(database: request.db)
            .page(index: id, with: 6)
            .map(ProjectModel.Output.init)
        
        return try await request.view.render("IndexView", IndexContext(
            view: ViewMetadata(title: "Projects"),
            items: entities,
            route: RouteMetadata(route: route)))
    }

    // [/show/:id]
    func getShow(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await ProjectRepository(database: request.db).find(id: id) else {
            throw Abort(.notFound)
        }
        
        return try await request.view.render("ShowView", ShowContext(
            view: ViewMetadata(title: "Project"),
            item: ProjectModel.Output(entity: entity),
            route: RouteMetadata(route: route)))
    }
}

extension ProjectsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("projects", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("show", ":id", use: self.getShow)
        })
    }
}
