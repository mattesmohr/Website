import Fluent
import Foundation

final class AssetEntity: Model, @unchecked Sendable {
    
    static let schema = "assets"
    
    @ID
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @OptionalField(key: "alternate_text")
    var alternateText: String?
    
    @Field(key: "file_name")
    var fileName: String
    
    @Field(key: "file_fullname")
    var fileFullName: String
    
    @Field(key: "file_path")
    var filePath: String
    
    @OptionalField(key: "file_extension")
    var fileExtension: String?
    
    @Field(key: "file_size")
    var fileSize: Int
    
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
    
    init(id: UUID? = nil, title: String, alternateText: String? = nil, fileName: String, fileFullName: String, filePath: String, fileExtension: String? = nil, fileSize: Int, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.title = title
        self.alternateText = alternateText
        self.fileName = fileName
        self.fileFullName = fileFullName
        self.filePath = filePath
        self.fileExtension = fileExtension
        self.fileSize = fileSize
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: AssetModel.Input) {
    
        self.init(title: input.title, alternateText: input.alternateText, fileName: input.asset.name, fileFullName: input.asset.filename, filePath: "/assets/\(input.asset.filename)", fileExtension: input.asset.extension, fileSize: input.asset.data.readableBytes)
    }
}
