import HTMLKitVapor
import Vapor

// [/area/admin/users]
struct UserAdminController {
    
    // [/]
    @Sendable
    func getIndex(_ request: Request) async throws -> View {
        
        let page: Int = request.query["page"] ?? 1
        
        let pagination = try await UserRepository(database: request.db)
            .find()
            .map(UserModel.Output.init)
            .page(page: page, per: 10)
        
        let viewModel = UserAdminPageModel.IndexView(pagination: pagination)
        
        return try await request.htmlkit.render(UserAdminPage.IndexView(viewModel: viewModel))
    }
    
    // [/create]
    @Sendable
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = UserAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(UserAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    @Sendable
    func postCreate(_ request: Request) async throws -> Response {
        
        try UserModel.Input.validate(content: request)
        
        let model = try request.content.decode(UserModel.Input.self)
        
        try await UserRepository(database: request.db)
            .insert(entity: UserEntity(input: model))
        
        return request.redirect(to: "/area/admin/users")
    }
    
    // [/edit/:id]
    @Sendable
    func getEdit(_ request: Request) async throws -> View {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        guard let entity = try await UserRepository(database: request.db)
            .find(id: id) else {
            throw Abort(.notFound)
        }
        
        let viewModel = UserAdminPageModel.EditView(user: UserModel.Output(entity: entity))
        
        return try await request.htmlkit.render(UserAdminPage.EditView(viewModel: viewModel))
    }
    
    // [/:id/edit/:model]
    @Sendable
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try UserModel.Input.validate(content: request)
        
        let model = try request.content.decode(UserModel.Input.self)
        
        try await UserRepository(database: request.db)
            .update(entity: UserEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/users")
    }
    
    // [/:id/delete]
    @Sendable
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await UserRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/users")
    }
}

extension UserAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("users") { routes in
            
            routes.get("", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get(":id", "edit", use: self.getEdit)
            routes.post(":id", "edit", use: self.postEdit)
            routes.get(":id", "delete", use: self.getDelete)
        }
    }
}
