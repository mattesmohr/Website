import Vapor
import HTMLKit
import HTMLKitComponents

struct CommentModel {
    
    /// An enumeration representing the potential states of a comment
    enum CommentStatus: String, Codable, CaseIterable {
        
        /// Indicates the comment is awaiting approval and is not visible until approved
        case pending
        
        /// Indicates the comment has been approved and is publicly visible
        case approved
        
        /// Indicates the comment has been archived and is only visible to administrators
        case archived
        
        /// The label for the comment status
        var description: String {
            
            switch self {
            case .pending:
                return "Pending"
                
            case .approved:
                return "Approved"
                
            case .archived:
                return "Archived"
            }
        }
        
        /// The localized label for the comment status
        var localizedDescription: LocalizedStringKey {
            
            switch self {
            case .pending:
                return "Pending"
                
            case .approved:
                return "Approved"
                
            case .archived:
                return "Archived"
            }
        }
    }
    
    /// The data transfer object for the comment input
    struct Input {
        
        struct Public: Vapor.Content, Validatable {
            
            /// The message of the comment
            var message: String
            
            /// A unique token to verify the forms origin
            let nonce: String
            
            static func validations(_ validations: inout Validations) {
                validations.add("message", as: String.self, is: !.empty)
            }
            
            static let validators = [
                Validator(field: "message", rule: .value),
            ]
            
            /// Sanitize the input before it is processed any further
            mutating func afterDecode() throws {
                
                self.message = message.sanitize()
            }
        }
        
        /// The data transfer object for the comment input
        struct Private: Vapor.Content, Validatable {
            
            /// The message of the comment
            var message: String
            
            /// The reply on the comment
            var reply: String?
            
            /// The status of the comment
            let status: String
            
            static func validations(_ validations: inout Validations) {
                validations.add("message", as: String.self, is: !.empty)
            }
            
            static let validators = [
                Validator(field: "message", rule: .value),
            ]
            
            /// Sanitize the input before it is processed any further
            mutating func afterDecode() throws {
                
                self.message = message.sanitize()
                self.reply = reply?.sanitize()
            }
        }
    }
    
    /// The data transfer object for the comment entity
    struct Output: Vapor.Content {
        
        /// The unique identifier of the comment
        let id: UUID
        
        /// The avatar image of the comment author
        var avatar: AssetModel.Output?
        
        /// The name of the comment author
        let name: String
        
        /// The full content of the comment
        let message: String
        
        /// The reply on the comment
        var reply: String?
        
        /// The status of the comment
        let status: CommentStatus
        
        /// The timestamp when the comment was first stored
        let createdAt: Date
        
        /// The timestamp when the comment was last updated
        let modifiedAt: Date
        
        init(id: UUID, avatar: AssetModel.Output? = nil, name: String, message: String, reply: String?, status: String, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.avatar = avatar
            self.name = name
            self.message = message
            self.reply = reply
            self.status = CommentStatus(rawValue: status)!
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: CommentEntity) {
            
            self.init(id: entity.id!, name: entity.name, message: entity.message, reply: entity.reply, status: entity.status, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
            
            if let avatar = entity.avatar {
                self.avatar = AssetModel.Output(entity: avatar)
            }
        }
    }
}
