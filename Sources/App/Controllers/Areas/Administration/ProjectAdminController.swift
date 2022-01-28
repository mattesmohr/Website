import Vapor
import Fluent

// [/area/admin/project]
final class ProjectAdminController {
    
    // [/index/:id]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: Int.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return ProjectRepository(database: request.db)
            .page(index: id, with: 10)
            .mapEach(ProjectModel.Output.init)
            .flatMapThrowing { entities in
                
                return ProjectAdminTemplate.IndexView()
                    .render(with: IndexContext(
                        view: ViewMetadata(title: "Project"),
                        items: entities,
                        identity: IdentityMetadata(user: user),
                        route: RouteMetadata(route: route)),
                    for: request)
            }
            .flatMap { view in
                return view
            }
    }
    
    // [/create]
    func getCreate(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        let model = ProjectModel(
            categories: ["ios"],
            states: ["published", "confidential"]
        )
        
        return request.view.render("/area/admin/project/create", CreateContext(
            
            view: ViewMetadata(title: "Create entry"),
            item: model,
            identity: IdentityMetadata(user: user),
            route: RouteMetadata(route: route)
        ))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try ProjectModel.Input.validate(content: request)
        
        var model = try request.content.decode(ProjectModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        return ProjectRepository(database: request.db)
            .insert(entity: ProjectEntity(input: model))
            .map { _ in
                return request.redirect(to: "/area/admin/project/index/0")
            }
    }
    
    // [/edit/:id]
    func getEdit(_ request: Request) throws -> EventLoopFuture<View> {
        
        guard let id = request.parameters.get("id", as: UUID.self), let route = request.route else {
            throw Abort(.badRequest)
        }
        
        guard let user = request.auth.get(UserModel.Output.self) else {
            throw Abort(.unauthorized)
        }
        
        return ProjectRepository(database: request.db)
            .find(id: id)
            .unwrap(or: Abort(.notFound))
            .flatMapThrowing { entity in
                
                let model = ProjectModel(
                
                    output: ProjectModel.Output(entity: entity),
                    categories: ["iOS", "macOS", "padOS"],
                    states: ["published", "draft", "archived"]
                )
                
                return request.view.render("/area/admin/project/edit", EditContext(
                    view: ViewMetadata(title: "Edit entry"),
                    item: model,
                    identity:  IdentityMetadata(user: user),
                    route: RouteMetadata(route: route)
                ))
            }
            .flatMap { view in
                return view
            }
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try ProjectModel.Input.validate(content: request)
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        var model = try request.content.decode(ProjectModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        return ProjectRepository(database: request.db)
            .update(entity: ProjectEntity(input: model), on: id)
            .map { _ in
                return request.redirect(to: "/area/admin/project/index/0")
            }
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) throws -> EventLoopFuture<Response> {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        return ProjectRepository(database: request.db)
            .delete(id: id)
            .map { _ in 
                return request.redirect(to: "/area/admin/project/index/0")
            }
    }
}

extension ProjectAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("projects", configure: { routes in
            
            routes.get("index", ":id", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        })
    }
}
