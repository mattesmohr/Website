import Vapor

struct RegisterModel: Content {
    
    struct Input: Content, Validatable {
        
        var email: String
        var password: String
        var confirmation: String
        
        init(email: String, password: String, confirmation: String) {
            
            self.email = email
            self.password = password
            self.confirmation = confirmation
        }
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("email", as: String.self, is: !.empty && .email)
            validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
            validations.add("confirmation", as: String.self, is: .count(8...) && .alphanumeric)
        }
    }
}
