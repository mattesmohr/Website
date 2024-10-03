import Vapor

/// A middleware responsible for tracking page requests and interactions
struct PageRequestTracker: AsyncMiddleware {

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        
        let repository = ReportRepository(database: request.db)
        
        if let entity = try await repository.find(uri: request.url.path) {
            try await repository.patch(field: \.$count, to: (entity.count + 1), for: entity.requireID())
            
        } else {
            try await repository.insert(entity: ReportEntity(uri: request.url.path, count: 1))
        }
        
        return try await next.respond(to: request)
    }
}
