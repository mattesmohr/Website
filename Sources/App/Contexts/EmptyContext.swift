import Vapor

struct EmptyContext: Content {

    var view: ViewMetadata
    var identity: IdentityMetadata?
    var route: RouteMetadata
}
