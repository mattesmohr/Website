import Vapor
import HTMLKit
import HTMLKitComponents

struct AccountModel {

    /// An enumeration representing the potential states of a credential
    enum AccountStatus: String, Codable, CaseIterable {
        
        /// Indicates the account is deactivated
        case deactivated
        
        /// Indicates the account is locked
        case locked
        
        /// Indicates the account is new
        case new
        
        /// Indicates the account is unlocked
        case unlocked
        
        /// The label for the credential status
        var description: String {
            
            switch self {
            case .deactivated:
                return "Deactivated"
                
            case .locked:
                return "Locked"
                
            case .new:
                return "New"
                
            case .unlocked:
                return "Unlocked"
            }
        }
    
        /// The localized label for the credential status
        var localizedDescription: LocalizedStringKey {
            
            switch self {
            case .deactivated:
                return "Deactivated"
                
            case .locked:
                return "Locked"
                
            case .new:
                return "New"
                
            case .unlocked:
                return "Unlocked"
            }
        }
    }
    
    /// The data transfer object for the credential input
    struct Input: Vapor.Content, Validatable {
        
        /// The plaintext version of the password
        let password: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("username", as: String.self, is: .email)
            validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
        }
        
        static let validators = [
            Validator(field: "username", rule: .email),
            Validator(field: "password", rule: .value)
        ]
    }
    
    /// The data transfer object for the credential entity
    struct Output: Vapor.Content {
        
        /// The unique identifier of the credential
        let id: UUID
        
        /// The hashed version of the password
        let password: String
        
        /// The current status of the credential, such as  locked or deactivated
        var status: String?
        
        /// The number of failed attempts using the credential
        let attempt: Int
        
        /// The timestamp when the credential was first stored
        let createdAt: Date
        
        /// The timestamp when the credential was last updated
        let modifiedAt: Date
        
        init(id: UUID, password: String, status: String? = nil, attempt: Int, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.password = password
            self.status = status
            self.attempt = attempt
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: AccountEntity) {
            
            self.init(id: entity.id!, password: entity.password, status: entity.status, attempt: entity.attempt, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}

