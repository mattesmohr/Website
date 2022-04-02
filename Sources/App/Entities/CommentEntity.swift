import Vapor
import Fluent

final class CommentEntity: Model {
    
    static let schema = "comments"
    
    @ID(key: "id")
    var id: UUID?
    
    @OptionalParent(key: "avatar_id")
    var avatar: AssetEntity?
    
    @Field(key: "name")
    var name: String

    @Field(key: "content")
    var content: String
    
    @Parent(key: "article_id")
    var article: ArticleEntity
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, avatarId: UUID? = nil, name: String, content: String, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.$avatar.id = avatarId
        self.name = name
        self.content = content
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: CommentModel.Input) {
        
        self.init(name: input.name, content: input.content)
    }
}
