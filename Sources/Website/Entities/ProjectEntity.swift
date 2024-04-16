import Fluent
import Foundation

final class ProjectEntity: Model {
    
    static let schema = "projects"
    
    @ID(key: "id")
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
    
    @OptionalField(key: "repository")
    var repository: String?
    
    @OptionalField(key: "documentation")
    var documentation: String?
    
    @Siblings(through: ProjectAsset.self, from: \.$project, to: \.$asset)
    var assets: [AssetEntity]
    
    @Parent(key: "author_id")
    var author: UserEntity
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, slug: String, thumbnailId: UUID? = nil, title: String, excerpt: String, content: String, category: String, status: String, repository: String? = nil, documentation: String? = nil, authorId: UUID, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.slug = slug
        self.$thumbnail.id = thumbnailId
        self.title = title
        self.excerpt = excerpt
        self.content = content
        self.category = category
        self.status = status
        self.repository = repository
        self.documentation = documentation
        self.$author.id = authorId
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: ProjectModel.Input) {
        
        self.init(slug: input.slug, title: input.title, excerpt: input.excerpt, content: input.content, category: input.category, status: input.status, repository: input.repository, documentation: input.documentation, authorId: input.authorId!)
        
        if let thumbnailId = input.thumbnailId {
            self.$thumbnail.id = UUID(uuidString: thumbnailId)
        }
    }
}

