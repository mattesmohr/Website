import Fluent
import Foundation

final class CommentEntity: Model, @unchecked Sendable {
    
    static let schema = "comments"
    
    @ID
    var id: UUID?
    
    @OptionalParent(key: "avatar_id")
    var avatar: AssetEntity?
    
    @Field(key: "name")
    var name: String

    @Field(key: "message")
    var message: String
    
    @OptionalField(key: "reply")
    var reply: String?
    
    @Field(key: "status")
    var status: String
    
    @Parent(key: "article_id")
    var article: ArticleEntity
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, avatarId: UUID? = nil, name: String, message: String, reply: String?, status: String, articleId: UUID, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.$avatar.id = avatarId
        self.name = name
        self.message = message
        self.reply = reply
        self.status = status
        self.$article.id = articleId
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    
    convenience init(input: CommentModel.Input.Public, on article: UUID) {
        
        self.init(name: "Anonymous", message: input.message, reply: nil, status: "pending", articleId: article)
    }
    
    convenience init(input: CommentModel.Input.Private, on article: UUID) {
        
        self.init(name: "Anonymous", message: input.message, reply: input.reply, status: input.status ,articleId: article)
    }
}
