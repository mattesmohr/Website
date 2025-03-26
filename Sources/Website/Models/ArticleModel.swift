import Vapor
import HTMLKit
import HTMLKitComponents

struct ArticleModel {
    
    /// An enumeration representing the potential states of a article
    enum ArticleCategory: String, Codable, CaseIterable {
        
        /// Indicates the article is about macos
        case macos

        /// Indicates the article is about ios
        case ios
        
        /// Indicates the article is about swift on server
        case server
        
        /// The label for the article category
        var description: String {
            
            switch self {
            case .macos:
                return "macOS"
                
            case .ios:
                return "iOS"
                
            case .server:
                return "Swift on server"
            }
        }
        
        /// The localized label for the article category
        var localizedDescription: LocalizedStringKey {
            
            switch self {
            case .macos:
                return "macOS"
                
            case .ios:
                return "iOS"
                
            case .server:
                return "Swift on server"
            }
        }
    }
    
    /// An enumeration representing the potential states of a article
    enum ArticleStatus: String, Codable, CaseIterable {
        
        /// Indicates the article is publicly visible
        case published
        
        /// Indicates the article is still a draft and not publicly visible
        case draft
        
        /// Indicates the article has been archived and is only visible to administrators
        case archived
        
        /// The label for the article status
        var description: String {
            
            switch self {
            case .published:
                return "Published"
                
            case .draft:
                return "Draft"
                
            case .archived:
                return "Archived"
            }
        }
        
        /// The localized label for the article status
        var localizedDescription: LocalizedStringKey {
            
            switch self {
            case .published:
                return "Published"
                
            case .draft:
                return "Draft"
                
            case .archived:
                return "Archived"
            }
        }
    }
    
    /// The data transfer object for the article input
    struct Input: Vapor.Content, Validatable {
        
        /// The identifier of the thumbnail image
        var thumbnailId: String?
        
        /// The title for the article
        var title: String
        
        /// A brief excerpt for the article
        var excerpt: String
        
        /// The full content for the article
        var content: String
        
        /// The category under which the article should be classified
        let category: String
        
        /// The publication status for the article
        let status: String
        
        /// The timestamp when the article should be published
        var publishedOn: Date?
        
        /// The author for the article
        var authorId: UUID?
        
        /// The slug representation of the article
        var slug: String {
            return title.replacingOccurrences(of: "", with: "-")
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
        }
    }
    
    /// The data transfer object for the article entity
    struct Output: Vapor.Content {
        
        /// The unique identifier of the article
        let id: UUID
        
        /// The slug representation of the article
        let slug: String
        
        /// The thumbnail image associated with the article
        var thumbnail: AssetModel.Output?
        
        /// The title of the article
        let title: String
        
        /// A brief excerpt of the article
        let excerpt: String
        
        /// The full content of the article
        let content: String
        
        /// The category  under which the category is classified
        let category: ArticleCategory
        
        /// The publication status of the article
        let status: ArticleStatus
        
        /// The timestamp when the article was published
        var publishedOn: Date?
        
        /// A list of assets related to the article
        var assets: [AssetModel.Output]?
        
        /// A list of comments associated with the article
        var comments: [CommentModel.Output]?
        
        /// The author of the article
        var author: UserModel.Output?
        
        /// The timestamp when the article was first stored
        let createdAt: Date
        
        /// The timestamp when the article was last updated
        let modifiedAt: Date
        
        init(id: UUID, slug: String, thumbnail: AssetModel.Output? = nil, title: String, excerpt: String, content: String, category: String, status: String, publishedOn: Date? = nil, assets: [AssetModel.Output]? = nil, comments: [CommentModel.Output]? = nil, author: UserModel.Output? = nil, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.slug = slug
            self.thumbnail = thumbnail
            self.title = title
            self.excerpt = excerpt
            self.content = content
            self.category = ArticleCategory(rawValue: category)!
            self.status = ArticleStatus(rawValue: status)!
            self.publishedOn = publishedOn
            self.assets = assets
            self.comments = comments
            self.author = author
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: ArticleEntity) {
            
            self.init(id: entity.id!, slug: entity.slug, title: entity.title, excerpt: entity.excerpt, content: entity.content, category: entity.category, status: entity.status, publishedOn: entity.publishedOn, author: UserModel.Output(entity: entity.author), createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        
            if let thumbnail = entity.thumbnail {
                self.thumbnail = AssetModel.Output(entity: thumbnail)
            }
            
            self.comments = entity.comments
                .map { entity in
                    return CommentModel.Output(entity: entity)
                }
            
            self.assets = entity.assets
                .map { entity in
                    return AssetModel.Output(entity: entity)
                }
        }
    }
}
