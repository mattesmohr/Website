import Vapor
import HTMLKitComponents

struct UserModel {
    
    enum Roles: String, Codable, CaseIterable {
        
        case administrator
        case moderator
        case customer
        
        var description: String {
            
            switch rawValue {
            case "administrator":
                return "Administrator"
                
            case "moderator":
                return "Moderator"
                
            case "customer":
                return "Customer"
                
            default:
                return "Unkown"
            }
        }
    }
    
    var output: Output?
    
    struct Input: Content, Validatable {
        
        var avatarId: String?
        var email: String
        var firstName: String?
        var lastName: String?
        var description: String?
        var role: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("email", as: String.self, is: !.empty)
            validations.add("firstName", as: String.self, is: !.empty)
            validations.add("lastName", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "email", rule: .email),
            Validator(field: "firstName", rule: .value),
            Validator(field: "lastName", rule: .value)
        ]
    }
    
    struct Output: Content, SessionAuthenticatable {
        
        var id: UUID
        var avatar: AssetModel.Output?
        var email: String
        var firstName: String?
        var lastName: String?
        var description: String?
        var role: String
        var createdAt: Date
        var modifiedAt: Date
        var sessionID: String {
            self.email
        }
        var fullname: String? {
            
            if let firstName, let lastName {
                return firstName + " " + lastName
            }
            
            return nil
        }
        
        init(id: UUID, avatar: AssetModel.Output? = nil, email: String, firstName: String? = nil, lastName: String? = nil, description: String? = nil, role: String, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.avatar = avatar
            self.email = email
            self.firstName = firstName
            self.lastName = lastName
            self.description = description
            self.role = role
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: UserEntity) {
            
            self.init(id: entity.id!, email: entity.email, firstName: entity.firstName, lastName: entity.lastName, description: entity.description, role: entity.role, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
            
            if let avatar = entity.avatar {
                self.avatar = AssetModel.Output(entity: avatar)
            }
        }
    }
}
