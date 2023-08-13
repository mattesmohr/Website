import Vapor

struct ReportModel {
    
    struct Input: Content, Validatable {
        
        var uri: String
        var count: Int?
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("uri", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID
        var uri: String
        var count: Int?
        var createdAt: Date
        var modifiedAt: Date
        
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

