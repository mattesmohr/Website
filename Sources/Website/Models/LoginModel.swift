import Vapor
import HTMLKitComponents

struct LoginModel {
    
    struct Input: Content, Validatable {
        
        /// The username for the login
        var email: String
        
        /// The plaintext password for the login
        var password: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("email", as: String.self, is: .email)
            validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
        }
        
        static let validators = [
            Validator(field: "email", rule: .email),
            Validator(field: "password", rule: .value)
        ]
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.email = email.sanitize()
            self.password = password.sanitize()
        }
    }
}
