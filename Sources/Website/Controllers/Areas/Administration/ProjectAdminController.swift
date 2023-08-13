import HTMLKitVapor
import Vapor

// [/area/admin/projects]
final class ProjectAdminController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await ProjectRepository(database: request.db)
            .find()
            .map(ProjectModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = ProjectAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(ProjectAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = ProjectAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(ProjectAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) async throws -> Response {
        
        try ProjectModel.Input.validate(content: request)
        
        var model = try request.content.decode(ProjectModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        try await ProjectRepository(database: request.db)
            .insert(entity: ProjectEntity(input: model))
        
        return request.redirect(to: "/area/admin/projects/index")
    }
    
    // [/edit/:id]
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await ProjectRepository(database: request.db)
            .find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = ProjectAdminPageModel.EditView(project: ProjectModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ProjectAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try ProjectModel.Input.validate(content: request)
        
        var model = try request.content.decode(ProjectModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        try await ProjectRepository(database: request.db)
            .update(entity: ProjectEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/projects/index")
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await ProjectRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/projects/index")
    }
}

extension ProjectAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("projects") { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        }
    }
}
