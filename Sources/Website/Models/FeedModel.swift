import Vapor
import HTMLKitComponents

struct FeedModel {
    
    struct Input: Content, Validatable {
        
        var thumbnailId: String?
        var message: String
        var tags: String
        var status: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("message", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "message", rule: .value)
        ]
    }
    
    struct Output: Content {
        
        var id: UUID
        var thumbnail: AssetModel.Output?
        var message: String
        var tags: String?
        var status: String
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, thumbnail: AssetModel.Output? = nil, message: String, tags: String? = nil, status: String, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.thumbnail = thumbnail
            self.message = message
            self.tags = tags
            self.status = status
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: FeedEntity) {
            
            self.init(id: entity.id!, message: entity.message, tags: entity.tags, status: entity.status, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
            
            if let thumbnail = entity.thumbnail {
                self.thumbnail = AssetModel.Output(entity: thumbnail)
            }
        }
    }
}
