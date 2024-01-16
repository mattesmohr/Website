import Vapor
import HTMLKitComponents

struct ProjectModel {
    
    enum Categories: String, CaseIterable {
        
        case macos
        case ios
        case server
        
        var description: String {
            
            switch rawValue {
            case "macos":
                return "macOS"
                
            case "ios":
                return "iOS"
                
            case "server":
                return "Swift on Server"
                
            default:
                return "Unkown"
            }
        }
    }
    
    enum States: String, CaseIterable {
        
        case published
        case confidential
        case draft
        
        var description: String {
            
            switch rawValue {
            case "published":
                return "Published"
                
            case "confidential":
                return "Confidential"
                
            case "draft":
                return "Draft"
                
            default:
                return "Unkown"
            }
        }
    }
    
    var output: Output?
    
    struct Input: Content, Validatable {
        
        var thumbnailId: String?
        var title: String
        var content: String
        var category: String
        var status: String
        var publishedOn: Date?
        var authorId: UUID?
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("title", as: String.self, is: !.empty)
            validations.add("content", as: String.self, is: !.empty)
            validations.add("category", as: String.self, is: !.empty)
            validations.add("status", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "title", rule: .value),
            Validator(field: "content", rule: .value),
            Validator(field: "category", rule: .value),
            Validator(field: "status", rule: .value)
        ]
    }
    
    struct Output: Content {
        
        var id: UUID
        var thumbnail: AssetModel.Output?
        var title: String
        var content: String
        var category: String
        var status: String
        var publishedOn: Date?
        var author: UserModel.Output?
        var links: [LinkModel.Output]?
        var assets: [AssetModel.Output]?
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, thumbnail: AssetModel.Output? = nil, title: String, content: String, category: String, status: String, publishedOn: Date? = nil, author: UserModel.Output? = nil, links: [LinkModel.Output]? = nil, assets: [AssetModel.Output]? = nil, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.thumbnail = thumbnail
            self.title = title
            self.content = content
            self.category = category
            self.status = status
            self.publishedOn = publishedOn
            self.author = author
            self.links = links
            self.assets = assets
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: ProjectEntity) {
            
            self.init(id: entity.id!, title: entity.title, content: entity.content, category: entity.category, status: entity.status, publishedOn: entity.publishedOn, author: UserModel.Output(entity: entity.author), createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
            
            if let thumbnail = entity.thumbnail {
                self.thumbnail = AssetModel.Output(entity: thumbnail)
            }
            
            self.links = entity.links
                .map { entity in
                    return LinkModel.Output(entity: entity)
                }
            
            self.assets = entity.assets
                .map { entity in
                    return AssetModel.Output(entity: entity)
                }
        }
        
    }
}
