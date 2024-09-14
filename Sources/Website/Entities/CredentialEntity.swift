import Fluent
import Foundation

final class CredentialEntity: Model, @unchecked Sendable {
    
    static let schema = "credentials"
    
    @ID
    var id: UUID?
    
    @Field(key: "password")
    var password: String
    
    @Field(key: "status")
    var status: String
    
    @Field(key: "attempt")
    var attempt: Int
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    @Parent(key: "user_id")
    var user: UserEntity
    
    init() {}
    
    init(id: UUID? = nil, password: String, status: String, attempt: Int, userId: UUID, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.password = password
        self.status = status
        self.attempt = attempt
        self.$user.id = userId
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
}
