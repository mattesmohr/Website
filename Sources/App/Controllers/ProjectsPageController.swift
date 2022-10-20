import Vapor

// [/projects]
final class ProjectsPageController {
    
    // [/index:/id]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return ProjectRepository(database: request.db)
            .page(index: id, with: 6)
            .mapEach(ProjectModel.Output.init)
            .flatMap { entities in
                
                return request.view.render("IndexView", IndexContext(
                    view: ViewMetadata(title: "Projects"),
                    items: entities,
                    route: RouteMetadata(route: route)))
            }
    }

    // [/show/:id]
    func getShow(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return ProjectRepository(database: request.db)
            .find(id: id)
            .unwrap(or: Abort(.notFound))
            .flatMap { entity in
                
                return request.view.render("ShowView", ShowContext(
                    view: ViewMetadata(title: "Project"),
                    item: ProjectModel.Output(entity: entity),
                    route: RouteMetadata(route: route)))
            }
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
