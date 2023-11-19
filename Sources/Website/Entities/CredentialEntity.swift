import Fluent
import Foundation

final class CredentialEntity: Model {
    
    static let schema = "credentials"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "username")
    var username: String
    
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
    
    init() {}
    
    init(id: UUID? = nil, username: String, password: String, status: String, attempt: Int, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.username = username
        self.password = password
        self.status = status
        self.attempt = attempt
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: CredentialModel.Input) {
        
        self.init(username: input.username, password: input.password, status: input.status, attempt: input.attempt)
    }
}
