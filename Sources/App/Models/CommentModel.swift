import Vapor

struct CommentModel: Content {
    
    struct Input: Content, Validatable {
        
        var name: String?
        var content: String?
        
        static func validations(_ validations: inout Validations) {
            validations.add("name", as: String.self, is: !.empty)
            validations.add("content", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID?
        var avatar: AssetModel.Output?
        var name: String?
        var content: String?
        var createdAt: Date?
        var modifiedAt: Date?
        
        init() {}
        
        init(id: UUID? = nil, avatar: AssetModel.Output? = nil, name: String? = nil, content: String? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
            
            self.id = id
            self.avatar = avatar
            self.name = name
            self.content = content
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: CommentEntity) {
            
            self.init(id: entity.id, avatar: AssetModel.Output(entity: entity.avatar!), name: entity.name, content: entity.content, createdAt: entity.createdAt, modifiedAt: entity.modifiedAt)
        }
    }
}
