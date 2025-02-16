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

extension Request {
    
    /// Access to the unit of work through Vapor's request object
    var unit: UnitOfWork {
        return .init(database: self.db)
    }
}

extension Application {
    
    /// Access to the unit of work through Vapor's application object
    var unit: UnitOfWork {
        return .init(database: self.db)
    }
}
