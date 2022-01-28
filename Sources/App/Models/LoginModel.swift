import Vapor

struct LoginModel: Content {
    
    var email: String?
    var password: String?
    
    init() {}
    
    init(email: String? = nil, password: String? = nil) {
        
        self.email = email
        self.password = password
    }
}

extension LoginModel: Validatable {
    
    static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: .email)
        validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
    }
}
