import HTMLKitComponents
import Vapor

struct ResetModel: Content {
    
    /// The data transfer object for the reset input
    struct Input: Content, Validatable {
        
        /// The plaintext password for the reset
        var password: String
        
        /// The password confirmation of the password
        var confirmation: String
        
        /// Validate the input
        static func validations(_ validations: inout Validations) {
            
            validations.add("password", as: String.self, is: .count(8...) && .ascii)
            validations.add("confirmation", as: String.self, is: .count(8...) && .ascii)
        }
        
        static let validators = [
            Validator(field: "password", rule: .value),
            Validator(field: "confirmation", rule: .value)
        ]
        
        /// Sanitize the input before it is processed any further
        mutating func afterDecode() throws {
            
            self.password = password.sanitize()
            self.confirmation = confirmation.sanitize()
        }
    }
}
