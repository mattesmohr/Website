import Vapor

struct UserModel: Content {
    
    var output: Output?
    
    struct Input: Content, Validatable {
        
        var avatarId: String?
        var email: String
        var firstName: String?
        var lastName: String?
        var description: String?
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("email", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content, SessionAuthenticatable {
        
        var id: UUID
        var avatar: AssetModel.Output?
        var email: String
        var firstName: String?
        var lastName: String?
        var description: String?
        var credential: CredentialModel.Output?
        var createdAt: Date
        var modifiedAt: Date
        var sessionID: String {
            self.email
        }
        
        init(id: UUID, avatar: AssetModel.Output? = nil, email: String, firstName: String? = nil, lastName: String? = nil, description: String? = nil, credential: CredentialModel.Output? = nil, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.avatar = avatar
            self.email = email
            self.firstName = firstName
            self.lastName = lastName
            self.description = description
            self.credential = credential
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: UserEntity) {
            
            self.init(id: entity.id!, email: entity.email, firstName: entity.firstName, lastName: entity.lastName, description: entity.description, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
            
            if let avatar = entity.avatar {
                self.avatar = AssetModel.Output(entity: avatar)
            }
            
            if let credential = entity.credential {
                self.credential = CredentialModel.Output(entity: credential)
            }
        }
    }
}
