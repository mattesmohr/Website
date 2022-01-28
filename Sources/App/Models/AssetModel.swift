import Vapor

struct AssetModel: Content {
    
    struct Input: Content, Validatable {
        
        var title: String?
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("title", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID?
        var title: String?
        var fileName: String?
        var fileFullName: String?
        var filePath: String?
        var fileExtension: String?
        var fileSize: Double?
        var modifiedAt: Date?
        var createdAt: Date?
        
        init() {}
        
        init(id: UUID? = nil, title: String? = nil, fileName: String? = nil, fileFullName: String? = nil, filePath: String? = nil, fileExtension: String? = nil, fileSize: Double? = nil, modifiedAt: Date? = nil, createdAt: Date? = nil) {

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
        
        init(entity: AssetEntity) {
            
            self.init(id: entity.id, title: entity.title, fileName: entity.fileName, fileFullName: entity.fileFullName, filePath: entity.filePath, fileExtension: entity.fileExtension, fileSize: entity.fileSize, modifiedAt: entity.modifiedAt, createdAt: entity.createdAt)
        }
    }
}
