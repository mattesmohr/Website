import HTMLKitVapor
import Vapor

// [/connect]
final class ConnectPageController {
    
    // [/index]
    func getIndex(_ request: Request) async throws -> View {
       
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        let context = EmptyContext(
            view: ViewMetadata(title: "Connect"),
            route: RouteMetadata(route: route))
        
        return try await request.htmlkit.render(ConnectPage.IndexView(context: context))
    }
    
    // [/index/:model]
    func postIndex(_ request: Request) async throws -> Response {
        
        try ContactModel.Input.validate(content: request)
        
        let model = try request.content.decode(ContactModel.Input.self)
        
        try await ContactRepository(database: request.db)
            .insert(entity: ContactEntity(input: model))
        
        return request.redirect(to: "/connect/Index")
    }
}

extension ConnectPageController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        
        routes.group("connect", configure: { routes in
            
            routes.get("index", use: self.getIndex)
            routes.post("index", use: self.postIndex)
        })
    }
}
