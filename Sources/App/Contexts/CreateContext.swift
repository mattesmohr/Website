import Vapor

struct CreateContext<T:Codable>: Codable {
    
    var view: ViewMetadata
    var item: T
    var identity: IdentityMetadata?
    var route: RouteMetadata
}
