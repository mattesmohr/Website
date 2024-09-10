import Vapor
import HTMLKitComponents

struct LoginModel {
    
    struct Input: Content, Validatable {
        
        var username: String
        var password: String
        
        init(username: String, password: String) {
            
            self.username = username
            self.password = password
        }
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("username", as: String.self, is: .email)
            validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
        }
        
        static let validators = [
            Validator(field: "username", rule: .email),
            Validator(field: "password", rule: .value)
        ]
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.username = username.sanitize()
            self.password = password.sanitize()
        }
    }
}
