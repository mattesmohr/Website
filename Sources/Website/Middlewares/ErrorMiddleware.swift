import Vapor

struct ErrorMiddleware: AsyncMiddleware {

    public func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        
        do {
            return try await next.respond(to: request)
            
        } catch {
            
            request.logger.report(error: error)
            
            if let _ = request.session.authenticated(UserModel.Output.self) {
                
                return try await request.htmlkit.render(ErrorPage.ErrorView(message: error.localizedDescription))
                    .encodeResponse(for: request)
            }
            
            return Response(status: .badRequest)
        }
    }
}
