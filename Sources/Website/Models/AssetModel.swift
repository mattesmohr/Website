import Vapor
import HTMLKitComponents

struct AssetModel {
    
    /// The data transfer object for the asset input
    struct Input: Content, Validatable {
        
        /// The title for the asset
        var title: String
        
        /// The asset file
        let asset: File
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("title", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "title", rule: .value),
        ]
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.title = title.sanitize()
        }
    }
    
    /// The data transfer object for the asset entity
    struct Output: Content {
        
        /// The unique identifier of the asset
        let id: UUID
        
        /// The title of the asset
        let title: String
        
        /// The file name of the asset
        var fileName: String?
        
        /// The file name with file extension of the asset
        var fileFullName: String?
        
        /// The full path of the asset
        var filePath: String?
        
        /// The file extension of the asset
        var fileExtension: String?
        
        /// The file size of the asset
        var fileSize: String?
        
        /// The timestamp when the asset was first stored
        let createdAt: Date
        
        /// The timestamp when the asset was last updated
        let modifiedAt: Date
        
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
