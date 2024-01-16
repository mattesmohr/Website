import Vapor
import HTMLKitComponents

struct AssetModel {
    
    var output: Output?
    
    struct Input: Content, Validatable {
        
        var title: String
        var asset: File
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("title", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "title", rule: .value),
        ]
    }
    
    struct Output: Content {
        
        var id: UUID
        var title: String
        var fileName: String?
        var fileFullName: String?
        var filePath: String?
        var fileExtension: String?
        var fileSize: String?
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, title: String, fileName: String? = nil, fileFullName: String? = nil, filePath: String? = nil, fileExtension: String? = nil, fileSize: Int? = nil, modifiedAt: Date, createdAt: Date) {

            self.id = id
            self.title = title
            self.fileName = fileName
            self.fileFullName = fileFullName
            self.filePath = filePath
            self.fileExtension = fileExtension
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
            
            let formatter = ByteCountFormatter()
            formatter.countStyle = .file
            formatter.allowedUnits = [.useMB]
            
            if let size = fileSize {
                self.fileSize = formatter.string(for: size)
            }
        }
        
        init(entity: AssetEntity) {
            
            self.init(id: entity.id!, title: entity.title, fileName: entity.fileName, fileFullName: entity.fileFullName, filePath: entity.filePath, fileExtension: entity.fileExtension, fileSize: entity.fileSize, modifiedAt: entity.modifiedAt!, createdAt: entity.createdAt!)
        }
    }
}
