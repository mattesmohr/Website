import Vapor

struct IndexContext<T:Codable>: Codable {

    var view: ViewMetadata
    var items: [T]
    var identity: IdentityMetadata?
    var route: RouteMetadata
}
