import Vapor

struct LinkModel: Content {
    
    struct Input: Content, Validatable {
        
        var title: String
        var url: String
        
        static func validations(_ validations: inout Validations) {
            validations.add("title", as: String.self, is: !.empty)
            validations.add("url", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID
        var title: String
        var url: String
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, title: String, url: String, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.title = title
            self.url = url
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: LinkEntity) {
            
            self.init(id: entity.id!, title: entity.title, url: entity.url, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}
