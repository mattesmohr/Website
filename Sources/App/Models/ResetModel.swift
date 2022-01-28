import Vapor

struct ResetModel: Content {
    
    var email: String?
    
    init() {}
    
    init(email: String? = nil) {
        
        self.email = email
    }
}

extension ResetModel: Validatable {
    
    static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email)
    }
}
