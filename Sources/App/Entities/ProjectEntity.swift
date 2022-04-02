import Vapor
import Fluent

final class ProjectEntity: Model {
    
    static let schema = "projects"
    
    @ID(key: "id")
    var id: UUID?

    @OptionalParent(key: "thumbnail_id")
    var thumbnail: AssetEntity?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "content")
    var content: String
    
    @Field(key: "category")
    var category: String
    
    @Field(key: "status")
    var status: String
    
    @OptionalField(key: "published_on")
    var publishedOn: Date?
    
    @Children(for: \.$solution)
    var links: [LinkEntity]
    
    @Siblings(through: ProjectAsset.self, from: \.$project, to: \.$asset)
    var assets: [AssetEntity]
    
    @Parent(key: "author_id")
    var author: UserEntity
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, thumbnailId: UUID? = nil, title: String, content: String, category: String, status: String, publishedOn: Date? = nil, authorId: UUID, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.$thumbnail.id = thumbnailId
        self.title = title
        self.content = content
        self.category = category
        self.status = status
        self.publishedOn = publishedOn
        self.$author.id = authorId
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: ProjectModel.Input) {
        
        self.init(title: input.title, content: input.content, category: input.category, status: input.status, publishedOn: input.publishedOn, authorId: input.authorId!)
        
        if let thumbnailId = input.thumbnailId {
            self.$thumbnail.id = UUID(uuidString: thumbnailId)
        }
    }
}

