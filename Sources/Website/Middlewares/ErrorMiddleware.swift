import Vapor

struct ErrorMiddleware: AsyncMiddleware {

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        
        do {
            return try await next.respond(to: request)
            
        } catch {
            
            request.logger.report(error: error)
            
            return try await request.htmlkit.render(ErrorPage.ErrorView(message: error.localizedDescription))
                .encodeResponse(for: request)
        }
    }
}
