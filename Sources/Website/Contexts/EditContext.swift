import Vapor

struct EditContext<T:Codable>: Codable {
    
    var view: ViewMetadata
    var item: T
    var identity: IdentityMetadata?
    var route: RouteMetadata
}
