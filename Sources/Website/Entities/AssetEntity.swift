import Fluent
import Foundation

final class AssetEntity: Model, @unchecked Sendable {
    
    static let schema = "assets"
    
    @ID
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @OptionalField(key: "fileName")
    var fileName: String?
    
    @OptionalField(key: "fileFullName")
    var fileFullName: String?
    
    @OptionalField(key: "filePath")
    var filePath: String?
    
    @OptionalField(key: "fileExtension")
    var fileExtension: String?
    
    @OptionalField(key: "fileSize")
    var fileSize: Int?
    
    @OptionalChild(for: \.$thumbnail)
    var article: ArticleEntity?
    
    @OptionalChild(for: \.$thumbnail)
    var solution: ProjectEntity?
    
    @OptionalChild(for: \.$avatar)
    var user: UserEntity?
    
    @Siblings(through: ProjectAsset.self, from: \.$asset, to: \.$project)
    var projects: [ProjectEntity]
    
    @Siblings(through: ArticleAsset.self, from: \.$asset, to: \.$article)
    var articles: [ArticleEntity]
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, title: String, fileName: String? = nil, fileFullName: String? = nil, filePath: String? = nil, fileExtension: String? = nil, fileSize: Int? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.title = title
        self.fileName = fileName
        self.fileFullName = fileFullName
        self.filePath = filePath
        self.fileExtension = fileExtension
        self.fileSize = fileSize
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: AssetModel.Input) {
    
        self.init(title: input.title, fileName: input.asset.name, fileFullName: input.asset.filename, filePath: "/assets/\(input.asset.filename)", fileExtension: input.asset.extension, fileSize: input.asset.data.readableBytes)
    }
}
