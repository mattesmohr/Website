import Vapor
import HTMLKit
import HTMLKitComponents

struct PostModel {
    
    /// An enumeration representing the potential states of a post
    enum PostStatus: String, Codable, CaseIterable {
        
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
    
    /// The data transfer object for the credential input
    struct Input: Vapor.Content, Validatable {
        
        var thumbnailId: Int?
        
        /// The post message
        var message: String
        
        /// The tags for the post
        let tags: String
        
        /// The publication status for the post
        let status: String
        
        static var validators: [HTMLKitComponents.Validator] {
            return [
                Validator(field: "message", rule: .value)
            ]
        }
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("message", as: String.self, is: !.empty)
        }
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.message = message.sanitize()
        }
    }
    
    /// The data transfer object for the post entity
    struct Output: Vapor.Content {
        
        /// The unique identifier of the post
        var id: Int
        
        var thumbnail: AssetModel.Output?
        
        /// The post message
        let message: String
        
        /// The tags of the post
        var tags: String?
        
        /// The publication status of the post
        let status: PostStatus
        
        /// The timestamp when the post was first stored
        let createdAt: Date
        
        /// The timestamp when the post was last updated
        let modifiedAt: Date
        
        init(id: Int, thumbnail: AssetModel.Output? = nil, message: String, tags: String? = nil, status: String, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.thumbnail = thumbnail
            self.message = message
            self.tags = tags
            self.status = PostStatus(rawValue: status)!
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: PostEntity) {
            
            self.init(id: entity.id!, message: entity.message, tags: entity.tags, status: entity.status, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
            
            if let thumbnail = entity.thumbnail {
                self.thumbnail = AssetModel.Output(entity: thumbnail)
            }
        }
    }
}
