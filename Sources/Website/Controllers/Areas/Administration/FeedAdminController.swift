import HTMLKitVapor
import Vapor

// [/area/admin/feed]
final class FeedAdminController {
    
    // [/]
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await FeedRepository(database: request.db)
            .find()
            .map(FeedModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = FeedAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(FeedAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = FeedAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(FeedAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) async throws -> Response {
        
        try FeedModel.Input.validate(content: request)
        
        let model = try request.content.decode(FeedModel.Input.self)
        
        try await FeedRepository(database: request.db)
            .insert(entity: FeedEntity(input: model))
        
        return request.redirect(to: "/area/admin/feed")
    }
    
    // [/:id/edit]
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await FeedRepository(database: request.db)
            .find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = FeedAdminPageModel.EditView(feed: FeedModel.Output(entity: entity))
        
        return try await request.htmlkit.render(FeedAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/:id/edit/:model]
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try FeedModel.Input.validate(content: request)
        
        let model = try request.content.decode(FeedModel.Input.self)
        
        try await FeedRepository(database: request.db)
            .update(entity: FeedEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/feed")
    }
    
    // [/:id/delete]
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await FeedRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/feed")
    }
}

extension FeedAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("feed") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get(":id", "edit", use: self.getEdit)
            routes.post(":id", "edit", use: self.postEdit)
            routes.get(":id", "delete", use: self.getDelete)
        }
    }
}
