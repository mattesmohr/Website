import HTMLKitVapor
import Vapor

// [/area/admin/assets]
final class AssetAdminController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await AssetRepository(database: request.db)
            .find()
            .map(AssetModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = AssetAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(AssetAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = AssetAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(AssetAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) async throws -> Response {
        
        try AssetModel.Input.validate(content: request)
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        try await AssetRepository(database: request.db)
            .insert(entity: AssetEntity(input: model))
        
        return request.redirect(to: "/area/admin/assets/index")
    }
    
    // [/edit/:id]
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await AssetRepository(database: request.db).find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = AssetAdminPageModel.EditView(asset: AssetModel.Output(entity: entity))
        
        return try await request.htmlkit.render(AssetAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/edit/:model]
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try AssetModel.Input.validate(content: request)
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        try await AssetRepository(database: request.db)
            .update(entity: AssetEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/assets/index")
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await AssetRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/assets/index")
    }
}

extension AssetAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("assets") { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        }
    }
}
