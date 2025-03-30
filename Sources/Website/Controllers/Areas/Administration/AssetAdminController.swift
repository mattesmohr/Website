import HTMLKitVapor
import Vapor

// [/area/admin/assets]
struct AssetAdminController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await request.unit.asset.find()
            .map(AssetModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = AssetAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(AssetAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    @Sendable
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = AssetAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(AssetAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    @Sendable
    func postCreate(_ request: Request) async throws -> Response {
        
        try AssetModel.Input.validate(content: request)
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        if model.asset.data.readableBytes > 0 {
            
            let path = request.application.directory.publicDirectory
                .appending("/assets/")
                .appending(model.asset.filename)
            
            try await request.fileio.writeFile(model.asset.data, at: path)
            
            try await request.unit.asset.insert(entity: AssetEntity(input: model))
            
        } else {
            throw Abort(.internalServerError)
        }
        
        return request.redirect(to: "/area/admin/assets")
    }
    
    // [/:id/edit]
    @Sendable
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.asset.find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = AssetAdminPageModel.EditView(asset: AssetModel.Output(entity: entity))
        
        return try await request.htmlkit.render(AssetAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/:id/edit/:model]
    @Sendable
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try AssetModel.Input.validate(content: request)
        
        let model = try request.content.decode(AssetModel.Input.self)
        
        if model.asset.data.readableBytes > 0 {
            
            let path = request.application.directory.publicDirectory
                .appending("/assets/")
                .appending(model.asset.filename)
            
            try await request.fileio.writeFile(model.asset.data, at: path)
            
            try await request.unit.asset.patch(field: \.$fileName, to: model.asset.name, for: id)
            try await request.unit.asset.patch(field: \.$fileFullName, to: model.asset.filename, for: id)
            try await request.unit.asset.patch(field: \.$filePath, to: "/assets/\(model.asset.filename)", for: id)
            try await request.unit.asset.patch(field: \.$fileExtension, to: model.asset.extension, for: id)
            try await request.unit.asset.patch(field: \.$fileSize, to: model.asset.data.readableBytes, for: id)
        }
        
        try await request.unit.asset.update(entity: AssetEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/assets")
    }
    
    // [/:id/delete]
    @Sendable
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await request.unit.asset.find(id: id) else {
            throw Abort(.notFound)
        }
        
        let path = request.application.directory.publicDirectory + entity.filePath
        
        try FileManager.default.removeItem(atPath: path)
        
        try await request.unit.asset.delete(id: id)
        
        return request.redirect(to: "/area/admin/assets")
    }
}

extension AssetAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("assets") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get(":id", "edit", use: self.getEdit)
            routes.post(":id", "edit", use: self.postEdit)
            routes.get(":id", "delete", use: self.getDelete)
        }
    }
}
