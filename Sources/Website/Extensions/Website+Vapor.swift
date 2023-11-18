import Vapor

extension Application {
    
    static let baseExecutionQueue = DispatchQueue(label: "vapor.codes.entrypoint")
    
    func runFromAsyncMainEntrypoint() async throws {
        
        try await withCheckedThrowingContinuation { continuation in
            
            Application.baseExecutionQueue.async { [self] in
                
                do {
                    try self.run()
                    
                    continuation.resume()
                    
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
