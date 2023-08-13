import Vapor
import HTMLKitComponents

struct ResetModel {
    
    struct Input: Content, Validatable {
        
        var email: String
        
        init(email: String) {
            
            self.email = email
        }
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("email", as: String.self, is: .email)
        }
        
        
        static let validators = [
            Validator(field: "email", rule: .email)
        ]
    }
}
