import Fluent
import Foundation

final class UserEntity: Model, @unchecked Sendable {
    
    static let schema = "users"
    
    @ID
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
    
    @Field(key: "role")
    var role: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?

    @Children(for: \.$author)
    var articles: [ArticleEntity]
    
    init() {}
    
    init(id: UUID? = nil, avatarID: UUID? = nil, email: String, firstName: String? = nil, lastName: String? = nil, description: String? = nil, role: String, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.$avatar.id = avatarID
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.description = description
        self.role = role
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: UserModel.Input) {
        
        self.init(email: input.email, firstName: input.firstName, lastName: input.lastName, description: input.description, role: input.role)
        
        if let avatarId = input.avatarId {
            self.$avatar.id = UUID(uuidString: avatarId)
        }
    }
}

