import Fluent
import Foundation

final class FeedEntity: Model, @unchecked Sendable {
    
    static let schema = "feeds"
    
    @ID
    var id: UUID?
    
    @OptionalParent(key: "thumbnail_id")
    var thumbnail: AssetEntity?
    
    @Field(key: "message")
    var message: String
    
    @OptionalField(key: "tags")
    var tags: String?
    
    @Field(key: "status")
    var status: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, thumbnailId: UUID? = nil, message: String, tags: String? = nil, status: String,  createdAt: Date? = nil, modifiedAt: Date? = nil) {
    
        self.id = id
        self.$thumbnail.id = thumbnailId
        self.message = message
        self.tags = tags
        self.status = status
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: FeedModel.Input) {
        
        self.init(message: input.message, tags: input.tags, status: input.status)
        
        if let thumbnailId = input.thumbnailId {
            self.$thumbnail.id = UUID(uuidString: thumbnailId)
        }
    }
}
