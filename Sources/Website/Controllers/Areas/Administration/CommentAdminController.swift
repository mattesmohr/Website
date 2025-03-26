import HTMLKitVapor
import Vapor

// [/area/admin/comments]
struct CommentAdminController {

    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {

        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await request.unit.comment.find()
            .map(CommentModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = CommentAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(CommentAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/:id/edit]
    @Sendable
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.comment.find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = CommentAdminPageModel.EditView(comment: CommentModel.Output(entity: entity))
        
        return try await request.htmlkit.render(CommentAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/:id/edit/:model]
    @Sendable
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try CommentModel.Input.Private.validate(content: request)

        let model = try request.content.decode(CommentModel.Input.Private.self)
        
        try await request.unit.comment.update(entity: CommentEntity(input: model, on: id), on: id)
        
        return request.redirect(to: "/area/admin/comments")
    }
    
    // [/:id/delete]
    @Sendable
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await request.unit.comment.delete(id: id)
        
        return request.redirect(to: "/area/admin/comments")
    }
}

extension CommentAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("comments") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get(":id", "edit", use: self.getEdit)
            routes.post(":id", "edit", use: self.postEdit)
            routes.get(":id", "delete", use: self.getDelete)
        }
    }
}

