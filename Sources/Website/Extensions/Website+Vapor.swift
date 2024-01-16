import Vapor

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
