import HTMLKitVapor
import Vapor

// [/area/admin/post]
struct PostAdminController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        let limit: Int = request.query["limit"] ?? 10
        
        guard let pagination = try await request.unit.post.find()
            .map(PostModel.Output.init)
            .page(at: page, per: limit) else {
            
            throw Abort(.badRequest)
        }
        
        let viewModel = PostAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(PostAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    @Sendable
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = PostAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(PostAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    @Sendable
    func postCreate(_ request: Request) async throws -> Response {
        
        try PostModel.Input.validate(content: request)
        
        let model = try request.content.decode(PostModel.Input.self)
        
        try await request.unit.post.insert(entity: PostEntity(input: model))
        
        return request.redirect(to: "/area/admin/posts")
    }
    
    // [/:id/edit]
    @Sendable
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.post.find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = PostAdminPageModel.EditView(post: PostModel.Output(entity: entity))
        
        return try await request.htmlkit.render(PostAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/:id/edit/:model]
    @Sendable
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        
        try PostModel.Input.validate(content: request)
        
        let model = try request.content.decode(PostModel.Input.self)
        
        try await request.unit.post.update(entity: PostEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/posts")
    }
    
    // [/:id/delete]
    @Sendable
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: Int.self) else {
            throw Abort(.badRequest)
        }
        
        try await request.unit.post.delete(id: id)
        
        return request.redirect(to: "/area/admin/posts")
    }
}

extension PostAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("posts") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get(":id", "edit", use: self.getEdit)
            routes.post(":id", "edit", use: self.postEdit)
            routes.get(":id", "delete", use: self.getDelete)
        }
    }
}
