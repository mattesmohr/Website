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
        var excerpt: String
        var content: String
        var category: String
        var status: String
        var repository: String?
        var documentation: String?
        var authorId: UUID?
        var slug: String {
            return title.replacingOccurrences(of: " ", with: "-").lowercased()
        }
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("title", as: String.self, is: !.empty)
            validations.add("excerpt", as: String.self, is: !.empty)
            validations.add("content", as: String.self, is: !.empty)
            validations.add("category", as: String.self, is: !.empty)
            validations.add("status", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "title", rule: .value),
            Validator(field: "excerpt", rule: .value),
            Validator(field: "content", rule: .value),
            Validator(field: "category", rule: .value),
            Validator(field: "status", rule: .value)
        ]
    }
    
    struct Output: Content {
        
        var id: UUID
        var slug: String
        var thumbnail: AssetModel.Output?
        var title: String
        var excerpt: String
        var content: String
        var category: String
        var status: String
        var author: UserModel.Output?
        var repository: String?
        var documentation: String?
        var assets: [AssetModel.Output]?
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, slug: String, thumbnail: AssetModel.Output? = nil, title: String, excerpt: String, content: String, category: String, status: String, repository: String? = nil, documentation: String? = nil, author: UserModel.Output? = nil, assets: [AssetModel.Output]? = nil, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.slug = slug
            self.thumbnail = thumbnail
            self.title = title
            self.excerpt = excerpt
            self.content = content
            self.category = category
            self.status = status
            self.author = author
            self.repository = repository
            self.documentation = documentation
            self.assets = assets
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: ProjectEntity) {
            
            self.init(id: entity.id!, slug: entity.slug, title: entity.title, excerpt: entity.excerpt, content: entity.content, category: entity.category, status: entity.status, repository: entity.repository, documentation: entity.documentation, author: UserModel.Output(entity: entity.author), createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
            
            if let thumbnail = entity.thumbnail {
                self.thumbnail = AssetModel.Output(entity: thumbnail)
            }
            
            self.assets = entity.assets
                .map { entity in
                    return AssetModel.Output(entity: entity)
                }
        }
        
    }
}
