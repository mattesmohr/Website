import HTMLKitVapor
import Vapor

// [/area/admin/users]
final class UserAdminController {
    
    // [/index]
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
    func getCreate(_ request: Request) async throws -> View {
        
        let viewModel = UserAdminPageModel.CreateView()
        
        return try await request.htmlkit.render(UserAdminPage.CreateView(viewModel: viewModel))
    }
    
    // [/create/:model]
    func postCreate(_ request: Request) async throws -> Response {
        
        try UserModel.Input.validate(content: request)
        
        let model = try request.content.decode(UserModel.Input.self)
        
        try await UserRepository(database: request.db)
            .insert(entity: UserEntity(input: model))
        
        return request.redirect(to: "/area/admin/users/index")
    }
    
    // [/edit/:id]
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
    
    // [/edit/:model]
    func postEdit(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try UserModel.Input.validate(content: request)
        
        let model = try request.content.decode(UserModel.Input.self)
        
        try await UserRepository(database: request.db)
            .update(entity: UserEntity(input: model), on: id)
        
        return request.redirect(to: "/area/admin/users/index")
    }
    
    // [/delete/:id]
    func getDelete(_ request: Request) async throws -> Response {
        
        guard let id = request.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        
        try await UserRepository(database: request.db)
            .delete(id: id)
        
        return request.redirect(to: "/area/admin/users/index")
    }
}

extension UserAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("users") { routes in
            
            routes.get("index", use: self.getIndex)
            routes.get("create", use: self.getCreate)
            routes.post("create", use: self.postCreate)
            routes.get("edit", ":id", use: self.getEdit)
            routes.post("edit", ":id", use: self.postEdit)
            routes.get("delete", ":id", use: self.getDelete)
        }
    }
}
