import Vapor
import Fluent

final class LinkEntity: Model {
    
    static let schema = "links"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "title")
    var title: String

    @Field(key: "url")
    var url: String
    
    @Parent(key: "solution_id")
    var solution: ProjectEntity
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, title: String, url: String, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.title = title
        self.url = url
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: LinkModel.Input) {
        
        self.init(title: input.title!, url: input.url!)
    }
}
