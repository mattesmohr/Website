import Foundation

/// A unique token to verify its form origin.
struct Nonce {
    
    /// The token value
    let value: String
    
    /// Creates a nonce
    init() {
        
        self.value = [UInt8].random(count: 32).base64
    }
    
    /// Verifies the form token with the global token
    ///
    /// - Parameter nonce: The nonce to check against.
    ///
    /// - Returns: Whether the nonce is valid.
    func verify(nonce: String) -> Bool {
        
        if self.value != nonce {
            return false
        }
        
        return true
    }
}
