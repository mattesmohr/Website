import Vapor
import Fluent

final class CredentialEntity: Model {
    
    static let schema = "credentials"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "role")
    var role: String
    
    @Field(key: "status")
    var status: String
    
    @OptionalChild(for: \.$credential)
    var user: UserEntity?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, password: String, role: CredentialRole, status: CredentialStatus, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.password = password
        self.role = role.rawValue
        self.status = status.rawValue
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: CredentialModel.Input) {
        self.init(password: input.password!, role: input.role!, status: input.status!)
    }
}

