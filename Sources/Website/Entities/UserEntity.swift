import Fluent
import Foundation

final class UserEntity: Model {
    
    static let schema = "users"
    
    @ID(key: "id")
    var id: UUID?
    
    @OptionalParent(key: "avatar_id")
    var avatar: AssetEntity?
    
    @Field(key: "email")
    var email: String
    
    @OptionalField(key: "first_name")
    var firstName: String?
    
    @OptionalField(key: "last_name")
    var lastName: String?
    
    @OptionalField(key: "description")
    var description: String?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?

    @OptionalParent(key: "credential_id")
    var credential: CredentialEntity?

    @Children(for: \.$author)
    var articles: [ArticleEntity]
    
    init() {}
    
    init(id: UUID? = nil, avatarID: UUID? = nil, email: String, firstName: String? = nil, lastName: String? = nil, description: String? = nil, credentialId: UUID? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.$avatar.id = avatarID
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.description = description
        self.$credential.id = credentialId
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: UserModel.Input) {
        
        self.init(email: input.email, firstName: input.firstName, lastName: input.lastName, description: input.description)
        
        if let avatarId = input.avatarId {
            self.$avatar.id = UUID(uuidString: avatarId)
        }
    }
}
