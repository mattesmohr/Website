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
    
    /// The data transfer object for the project input
    struct Input: Content, Validatable {
        
        /// The identifier of the thumbnail image
        var thumbnailId: String?
        
        /// The title for the project
        var title: String
        
        /// A brief excerpt for the project
        var excerpt: String
        
        /// The full content for the project
        var content: String
        
        /// The category under which the project should be classified
        let category: String
        
        /// The publication status for the project
        let status: String
        
        /// A link to the git repository
        var repository: String?
        
        /// A link to the documentation
        var documentation: String?
        
        /// The timestamp when the project should be published
        var publishedOn: Date?
        
        /// The author for the article
        var authorId: UUID?
        
        /// The slug representation of the project
        var slug: String {
            return title.replacingOccurrences(of: " ", with: "-")
                .replacingOccurrences(of: "ä", with: "ae")
                .replacingOccurrences(of: "ö", with: "oe")
                .replacingOccurrences(of: "ü", with: "ue")
                .replacingOccurrences(of: "ß", with: "ss")
                .lowercased()
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
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.title = title.sanitize()
            self.excerpt = excerpt.sanitize()
            self.content = content.sanitize()
            self.repository = repository?.sanitize()
            self.documentation = documentation?.sanitize()
        }
    }
    
    /// The data transfer object for the project entity
    struct Output: Content {
        
        /// The unique identifier of the project
        let id: UUID
        
        /// The slug representation of the project
        let slug: String
        
        /// The thumbnail image associated with the project
        var thumbnail: AssetModel.Output?
        
        /// The title of the project
        let title: String
        
        /// A brief excerpt of the project
        let excerpt: String
        
        /// The full content of the project
        let content: String
        
        /// The category under which the project was classified
        let category: String
        
        /// The publication status of the project
        let status: String
        
        /// The author of the project
        var author: UserModel.Output?
        
        /// A link to the git repository
        var repository: String?
        
        /// A link to the documentation
        var documentation: String?
        
        /// A list of assets related to the article
        var assets: [AssetModel.Output]?
        
        /// The timestamp when the article was first stored
        let createdAt: Date
        
        /// The timestamp when the article was last updated
        let modifiedAt: Date
        
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
