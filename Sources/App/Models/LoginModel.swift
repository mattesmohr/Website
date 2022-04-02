import Vapor

struct LoginModel: Content {
    
    struct Input: Content, Validatable {
        
        var email: String
        var password: String
        
        init(email: String, password: String) {
            
            self.email = email
            self.password = password
        }
        
        static func validations(_ validations: inout Validations) {
            validations.add("email", as: String.self, is: .email)
            validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
        }
    }
}
