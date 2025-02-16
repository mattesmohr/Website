import HTMLKitVapor
import Vapor

// [/area/admin/setting]
struct SettingAdminController {
    
    //  [/]
    @Sendable
    func getEdit(_ request: Request) async throws -> View {
        
        let settings = try await request.unit.setting.find()
        
        if let settings = settings {
    
            let viewModel = SettingAdminPageModel.EditViewModel(settings: SettingModel.Output(entity: settings))
            
            return try await request.htmlkit.render(SettingAdminPage.EditView(viewModel: viewModel))
        }
        
        return try await request.htmlkit.render(SettingAdminPage.CreateView(viewModel: SettingAdminPageModel.CreateViewModel()))
    }
    
    //  [/edit]
    @Sendable
    func postEdit(_ request: Request) async throws -> Response {
        
        let input = try request.content.decode(SettingModel.Input.self)
        
        if let settings = try await request.unit.setting.find() {
            
            try await request.unit.setting.update(entity: SettingEntity(input: input), on: settings.requireID())
            
        } else {
            
            try await request.unit.setting.insert(entity: SettingEntity(input: input))
        }
        
        return request.redirect(to: "/area/admin/setting")
    }
}

extension SettingAdminController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("setting") { routes in
            
            routes.get("", use: self.getEdit)
            routes.post("", use: self.postEdit)
        }
    }
}
