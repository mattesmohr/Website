import Vapor

struct ResetModel: Content {
    
    struct Input: Content, Validatable {
        
        var email: String
        
        init(email: String) {
            
            self.email = email
        }
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("email", as: String.self, is: .email)
        }
    }
}
