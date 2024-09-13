import Vapor
import HTMLKitComponents

struct FeedModel {
    
    /// The data transfer object for the credential input
    struct Input: Content, Validatable {
        
        var thumbnailId: String?
        
        /// The feed message
        var message: String
        
        /// The tags for the feed
        let tags: String
        
        /// The publication status for the feed
        let status: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("message", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "message", rule: .value)
        ]
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.message = message.sanitize()
        }
    }
    
    /// The data transfer object for the feed entity
    struct Output: Content {
        
        /// The unique identifier of the feed
        var id: UUID
        var thumbnail: AssetModel.Output?
        
        /// The feed message
        let message: String
        
        /// The tags of the feed
        var tags: String?
        
        /// The publication status of the feed
        let status: String
        
        /// The timestamp when the feed was first stored
        let createdAt: Date
        
        /// The timestamp when the feed was last updated
        let modifiedAt: Date
        
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
