import Vapor

// [/solutions]
final class ProjectsPageController {
    
    // [/index:/id]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return ProjectRepository(database: request.db)
            .page(index: id, with: 6)
            .mapEach(ProjectModel.Output.init)
            .flatMapThrowing { entities in
                
                return ProjectPageTemplate.IndexView()
                    .render(with: IndexContext(
                        view: ViewMetadata(title: "Show entries"),
                        items: entities,
                        identity: IdentityMetadata(user: user),
                        route: RouteMetadata(route: route)),
                for: request)
            }
            .flatMap { view in
                return view
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
                
                return request.view.render("/projects/show", ShowContext(
                    view: ViewMetadata(title: "Show entry"),
                    item: ProjectModel.Output(entity: entity),
                    route: RouteMetadata(route: route)
                ))
            }
    }
}

extension ProjectsPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("solutions", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("show", ":id", use: self.getShow)
        })
    }
}
