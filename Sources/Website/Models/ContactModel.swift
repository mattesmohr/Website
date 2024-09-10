import Vapor
import HTMLKitComponents

struct ContactModel {
    
    struct Input: Content, Validatable {
        
        var firstName: String
        var lastName: String
        var email: String
        var message: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("firstname", as: String.self, is: !.empty)
            validations.add("lastname", as: String.self, is: !.empty)
            validations.add("email", as: String.self, is: .email)
            validations.add("message", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "firstName", rule: .value),
            Validator(field: "lastName", rule: .value),
            Validator(field: "email", rule: .email),
            Validator(field: "message", rule: .value)
        ]
    }
    
    struct Output: Content {
        
        var id: UUID
        var firstName: String
        var lastName: String
        var email: String
        var message: String
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, firstName: String, lastName: String, email: String, message: String, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.firstName = firstName
            self.lastName = lastName
            self.message = message
            self.email = email
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: ContactEntity) {
            
            self.init(id: entity.id!, firstName: entity.firstName, lastName: entity.lastName, email: entity.email, message: entity.message, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}

extension ContactModel.Output: Equatable {
    
    public static func == (lhs: ContactModel.Output, rhs: ContactModel.Output) -> Bool {
        return lhs.id == rhs.id
    }
}
