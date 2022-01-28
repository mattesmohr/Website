import Vapor

struct ContactModel: Content {
    
    struct Input: Content, Validatable {
        
        var firstName: String?
        var lastName: String?
        var email: String?
        var message: String?
        
        static func validations(_ validations: inout Validations) {
            validations.add("firstname", as: String.self, is: !.empty)
            validations.add("lastname", as: String.self, is: !.empty)
            validations.add("email", as: String.self, is: .email)
            validations.add("message", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID?
        var firstName: String?
        var lastName: String?
        var message: String?
        var email: String?
        var createdAt: Date?
        var modifiedAt: Date?
        
        init() {}
        
        init(id: UUID? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, message: String? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
            
            self.id = id
            self.firstName = firstName
            self.lastName = lastName
            self.message = message
            self.email = email
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: ContactEntity) {
            
            self.init(id: entity.id, firstName: entity.firstName, lastName: entity.lastName, email: entity.email, message: entity.message, createdAt: entity.createdAt, modifiedAt: entity.modifiedAt)
        }
    }
}
