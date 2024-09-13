import Vapor
import HTMLKitComponents

struct ContactModel {
    
    /// The data transfer object for the contact input
    struct Input: Content, Validatable {
        
        /// The first name for the contact
        var firstName: String
        
        /// The last name for the contact
        var lastName: String
        
        /// The email address for the contact
        var email: String
        
        /// A message about the contact
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
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.firstName = firstName.sanitize()
            self.lastName = lastName.sanitize()
            self.email = email.sanitize()
            self.message = message.sanitize()
        }
    }
    
    /// The data transfer object for the contact entity
    struct Output: Content {
        
        /// The  unique identifier of the contact
        let id: UUID
        
        /// The first name of the contact
        let firstName: String
        
        /// The last name of the contact
        let lastName: String
        
        /// The email address of the contact
        let email: String
        
        /// A message about the contact
        let message: String
        
        /// The timestamp when the article was first stored
        let createdAt: Date
        
        /// The timestamp when the article was last updated
        let modifiedAt: Date
        
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
