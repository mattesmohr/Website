import Fluent
import Foundation

final class ArticleEntity: Model, @unchecked Sendable {
    
    static let schema = "articles"
    
    @ID
    var id: UUID?
    
    @Field(key: "slug")
    var slug: String
    
    @OptionalParent(key: "thumbnail_id")
    var thumbnail: AssetEntity?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "excerpt")
    var excerpt: String
    
    @Field(key: "content")
    var content: String
    
    @Field(key: "category")
    var category: String
    
    @Field(key: "status")
    var status: String
    
    @OptionalField(key: "published_on")
    var publishedOn: Date?
    
    @Children(for: \.$article)
    var comments: [CommentEntity]
    
    @Siblings(through: ArticleAsset.self, from: \.$article, to: \.$asset)
    var assets: [AssetEntity]
    
    @Parent(key: "author_id")
    var author: UserEntity
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, slug: String, thumbnailId: UUID? = nil, title: String, excerpt: String, content: String, category: String, status: String, publishedOn: Date? = nil, authorId: UUID, createdAt: Date? = nil, modifiedAt: Date? = nil) {
    
        self.id = id
        self.slug = slug
        self.$thumbnail.id = thumbnailId
        self.title = title
        self.excerpt = excerpt
        self.content = content
        self.category = category
        self.status = status
        self.publishedOn = publishedOn
        self.$author.id = authorId
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: ArticleModel.Input) {
        
        self.init(slug: input.slug, title: input.title, excerpt: input.excerpt, content: input.content, category: input.category, status: input.status, publishedOn: input.publishedOn, authorId: input.authorId!)
        
        if let thumbnailId = input.thumbnailId {
            self.$thumbnail.id = UUID(uuidString: thumbnailId)
        }
    }
}

