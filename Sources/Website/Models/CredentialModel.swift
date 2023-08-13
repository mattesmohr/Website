import Vapor

struct CredentialModel {
    
    enum Roles: String, Codable, CaseIterable {
        
        case administrator
        case moderator
        case customer
    }

    enum States: String, Codable, CaseIterable {
        
        case deactivated
        case locked
        case new
        case unlocked
    }
    
    var output: Output?
    
    struct Input: Content, Validatable {
        
        var password: String
        var role: String
        var status: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("password", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID
        var password: String
        var role: String?
        var status: String?
        var createdAt: Date
        var modifiedAt: Date
        
        init(id: UUID, password: String, role: String? = nil, status: String? = nil, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.password = password
            self.role = role
            self.status = status
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: CredentialEntity) {
            
            self.init(id: entity.id!, password: entity.password, role: entity.role, status: entity.status, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}

