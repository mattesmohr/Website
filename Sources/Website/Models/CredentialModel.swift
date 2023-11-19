import Vapor
import HTMLKitComponents

struct CredentialModel {

    enum States: String, Codable, CaseIterable {
        
        case deactivated
        case locked
        case new
        case unlocked
    }
    
    var output: Output?
    
    struct Input: Content, Validatable {
        
        var username: String
        var password: String
        var status: String
        var attempt: Int
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("username", as: String.self, is: .email)
            validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
        }
        
        static let validators = [
            Validator(field: "username", rule: .email),
            Validator(field: "password", rule: .value)
        ]
    }
    
    struct Output: Content {
        
        var id: UUID
        var username: String
        var password: String
        var status: String?
        var attempt: Int
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, username: String, password: String, status: String? = nil, attempt: Int, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.username = username
            self.password = password
            self.status = status
            self.attempt = attempt
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: CredentialEntity) {
            
            self.init(id: entity.id!, username: entity.username, password: entity.password, status: entity.status, attempt: entity.attempt, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}

