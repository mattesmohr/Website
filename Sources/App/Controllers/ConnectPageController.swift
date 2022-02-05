import Vapor

// [/connect]
final class ConnectPageController {
    
    // [/index]
    func getIndex(_ request: Request) throws -> EventLoopFuture<View> {
       
        guard let route = request.route else {
            throw Abort(.badRequest)
        }
        
        return ConnectPageTemplate.IndexView()
            .render(with: EmptyContext(
                view: ViewMetadata(title: "Connect"),
                route: RouteMetadata(route: route)),
            for: request)
    }
    
    // [/index/:model]
    func postIndex(_ request: Request) throws -> EventLoopFuture<Response> {
        
        try ContactModel.Input.validate(content: request)
        
        let model = try request.content.decode(ContactModel.Input.self)
        
        return ContactRepository(database: request.db)
            .insert(entity: ContactEntity(input: model))
            .map { _ in 
                return request.redirect(to: "/connect/Index")
            }
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
