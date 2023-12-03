import Fluent
import Foundation

final class FeedEntity: Model {
    
    static let schema = "feeds"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "message")
    var message: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, message: String, createdAt: Date? = nil, modifiedAt: Date? = nil) {
    
        self.id = id
        self.message = message
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: FeedModel.Input) {
        
        self.init(message: input.message)
    }
}
