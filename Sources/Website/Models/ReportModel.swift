import Vapor

struct ReportModel {
    
    /// The data transfer object for the report input
    struct Input: Content, Validatable {
        
        /// The url which was visited
        let uri: String
        
        /// The number of times the url was visited
        var count: Int?
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("uri", as: String.self, is: !.empty)
        }
    }
    
    /// The data transfer object for the report entity
    struct Output: Content {
        
        /// The unique identifier of the report
        let id: UUID
        
        /// The url which was visited
        let uri: String
        
        /// The number of times the url was visited
        var count: Int?
        
        /// The timestamp when the report was first stored
        let createdAt: Date
        
        /// The timestamp when the report was last updated
        let modifiedAt: Date
        
        init(id: UUID, uri: String, count: Int? = nil, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.uri = uri
            self.count = count
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: ReportEntity) {
            
            self.init(id: entity.id!, uri: entity.uri, count: entity.count, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}

