import Vapor

/// A middleware that catches and displays errors on the page
struct ErrorMiddleware: AsyncMiddleware {

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        
        do {
            return try await next.respond(to: request)
            
        } catch {
            
            request.logger.report(error: error)
            
            if request.url.path.contains("/area") {
                
                return try await request.htmlkit.render(ErrorAdminPage.ErrorView(message: error.localizedDescription))
                    .encodeResponse(for: request)
            }
            
            if let _ = request.session.authenticated(UserModel.Output.self) {
                
                return try await request.htmlkit.render(ErrorPage.ErrorView(message: error.localizedDescription))
                    .encodeResponse(for: request)
            }
            
            return try await request.htmlkit.render(ErrorPage.ErrorView())
                .encodeResponse(for: request)
        }
    }
}
