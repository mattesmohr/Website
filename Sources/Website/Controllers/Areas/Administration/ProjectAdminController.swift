import HTMLKitVapor
import Vapor

// [/area/admin/projects]
struct ProjectAdminController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await request.unit.project.find()
            .map(ProjectModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = ProjectAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(ProjectAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    @Sendable
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = ProjectAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(ProjectAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    @Sendable
    func postCreate(_ request: Request) async throws -> Response {
        
        try ProjectModel.Input.validate(content: request)
        
        var model = try request.content.decode(ProjectModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        if model.status == "published" {
            model.publishedOn = Date.now
        }
        
        try await request.unit.project.insert(entity: ProjectEntity(input: model))
        
        return request.redirect(to: "/area/admin/projects")
    }
    
    // [/:id/edit]
    @Sendable
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.project.find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = ProjectAdminPageModel.EditView(project: ProjectModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ProjectAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/:id/edit/:model]
    @Sendable
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try ProjectModel.Input.validate(content: request)
        
        var model = try request.content.decode(ProjectModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        if model.status == "published" {
            model.publishedOn = Date.now
        }
        
        try await request.unit.project.update(entity: ProjectEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/projects")
    }
    
    // [/:id/delete]
    @Sendable
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await request.unit.project.delete(id: id)
        
        return request.redirect(to: "/area/admin/projects")
    }
}

extension ProjectAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("projects") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get(":id", "edit", use: self.getEdit)
            routes.post(":id", "edit", use: self.postEdit)
            routes.get(":id", "delete", use: self.getDelete)
        }
    }
}
