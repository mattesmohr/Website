import Vapor

struct CreateContext: Codable {
    
    var view: ViewMetadata
    var identity: IdentityMetadata?
    var route: RouteMetadata
}
