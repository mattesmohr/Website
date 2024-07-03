import HTMLKitVapor
import Vapor

// [/area/admin/articles]
final class ArticleAdminController {

    // [/]
    func getIndex(_ request: Request) async throws -> View {

        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await ArticleRepository(database: request.db)
            .find()
            .map(ArticleModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = ArticleAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(ArticleAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = ArticleAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(ArticleAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) async throws -> Response {
        
        try ArticleModel.Input.validate(content: request)
        
        var model = try request.content.decode(ArticleModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        try await ArticleRepository(database: request.db)
            .insert(entity: ArticleEntity(input: model))
        
        return request.redirect(to: "/area/admin/articles")
    }
    
    // [/:id/edit]
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await ArticleRepository(database: request.db)
            .find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = ArticleAdminPageModel.EditView(article: ArticleModel.Output(entity: entity))
        
        return try await request.htmlkit.render(ArticleAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/:id/edit/:model]
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try ArticleModel.Input.validate(content: request)

        var model = try request.content.decode(ArticleModel.Input.self)
        model.authorId = try request.auth.require(UserModel.Output.self).id
        
        if model.status == "published" {
            model.publishedOn = Date.now
        }
        
        try await ArticleRepository(database: request.db)
            .update(entity: ArticleEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/articles")
    }
    
    // [/:id/delete]
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await ArticleRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/articles")
    }
}

extension ArticleAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
    
        routes.group("articles") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get(":id", "edit", use: self.getEdit)
            routes.post(":id", "edit", use: self.postEdit)
            routes.get(":id", "delete", use: self.getDelete)
        }
    }
}

