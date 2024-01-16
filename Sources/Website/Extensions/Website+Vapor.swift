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

extension File {
    
    public var name: String? {
        
        let parts = self.filename.split(separator: ".")
        
        if parts.count > 1 {
            return parts.first.map(String.init)
            
        } else {
            return nil
        }
    }
}
