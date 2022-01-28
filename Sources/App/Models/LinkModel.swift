import Vapor

struct LinkModel: Content {
    
    struct Input: Content, Validatable {
        
        var title: String?
        var url: String?
        
        static func validations(_ validations: inout Validations) {
            validations.add("email", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID?
        var title: String?
        var url: String?
        var createdAt: Date?
        var modifiedAt: Date?
        
        init() {}
        
        init(id: UUID? = nil, title: String? = nil, url: String? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
            
            self.id = id
            self.title = title
            self.url = url
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: LinkEntity) {
            
            self.init(id: entity.id, createdAt: entity.createdAt, modifiedAt: entity.modifiedAt)
        }
    }
}
