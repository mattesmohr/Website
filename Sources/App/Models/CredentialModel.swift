import Vapor

struct CredentialModel: Content {
    
    var output: Output?
    var roles: [String]?
    var status: [String]?
    
    struct Input: Content, Validatable {
        
        var password: String?
        var role: CredentialRole?
        var status: CredentialStatus?
        
        static func validations(_ validations: inout Validations) {
            validations.add("email", as: String.self, is: !.empty)
            validations.add("password", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID?
        var password: String?
        var role: CredentialRole?
        var status: CredentialStatus?
        var createdAt: Date?
        var modifiedAt: Date?
        
        init(id: UUID? = nil, password: String? = nil, role: CredentialRole? = nil, status: CredentialStatus? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
            
            self.id = id
            self.password = password
            self.role = role
            self.status = status
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: CredentialEntity) {
            
            self.init(id: entity.id, password: entity.password, role: CredentialRole(rawValue: entity.role), status: CredentialStatus(rawValue: entity.status), createdAt: entity.createdAt, modifiedAt: entity.modifiedAt)
        }
    }
}

