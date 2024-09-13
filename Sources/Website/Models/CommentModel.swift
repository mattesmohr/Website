import Vapor

struct CommentModel {
    
    /// The data transfer object for the comment input
    struct Input: Content, Validatable {
        
        /// The name of the comment author
        var name: String
        
        /// The content of the comment
        var content: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("name", as: String.self, is: !.empty)
            validations.add("content", as: String.self, is: !.empty)
        }
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.name = name.sanitize()
            self.content = content.sanitize()
        }
    }
    
    /// The data transfer object for the comment entity
    struct Output: Content {
        
        /// The unique identifier of the comment
        let id: UUID
        
        /// The avatar image of the comment author
        var avatar: AssetModel.Output?
        
        /// The name of the comment author
        let name: String
        
        /// The full content of the comment
        let content: String
        
        /// The timestamp when the comment was first stored
        let createdAt: Date
        
        /// The timestamp when the comment was last updated
        let modifiedAt: Date
        
        init(id: UUID, avatar: AssetModel.Output? = nil, name: String, content: String, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.avatar = avatar
            self.name = name
            self.content = content
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: CommentEntity) {
            
            self.init(id: entity.id!, avatar: AssetModel.Output(entity: entity.avatar!), name: entity.name, content: entity.content, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}
