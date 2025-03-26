import Vapor
import HTMLKitComponents

struct AccountModel {

    enum States: String, Codable, CaseIterable {
        
        case deactivated
        case locked
        case new
        case unlocked
    }
    
    /// The data transfer object for the account input
    struct Input: Content, Validatable {
        
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
    
    /// The data transfer object for the account entity
    struct Output: Content {
        
        /// The unique identifier of the account
        let id: UUID
        
        /// The hashed version of the password
        let password: String
        
        /// The current status of the account, such as  locked or deactivated
        var status: String?
        
        /// The number of failed attempts using the account
        let attempt: Int
        
        /// The timestamp when the account was first stored
        let createdAt: Date
        
        /// The timestamp when the account was last updated
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

