import Vapor

/// A middleware responsible for tracking page requests and interactions
struct PageRequestTracker: AsyncMiddleware {

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        
        if let entity = try await request.unit.report.find(uri: request.url.path) {
            try await request.unit.report.patch(field: \.$count, to: (entity.count + 1), for: entity.requireID())
            
        } else {
            try await request.unit.report.insert(entity: ReportEntity(uri: request.url.path, count: 1))
        }
        
        return try await next.respond(to: request)
    }
}
