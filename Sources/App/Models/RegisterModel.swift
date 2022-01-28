import Vapor

struct RegisterModel: Content {
    
    var email: String?
    var password: String?
    var confirmation: String?
    var code: String?
    
    init() {}
    
    init(email: String? = nil, password: String? = nil, confirmation: String? = nil, code: String?) {
        
        self.email = email
        self.password = password
        self.confirmation = confirmation
        self.code = code
    }
}

extension RegisterModel: Validatable {
    
    static func validations(_ validations: inout Validations) {
        validations.add("email", as: String.self, is: !.empty && .email)
        validations.add("password", as: String.self, is: .count(8...) && .alphanumeric)
        validations.add("confirmation", as: String.self, is: .count(8...) && .alphanumeric)
        validations.add("code", as: String.self, is: !.empty && .count(4...))
    }
}
