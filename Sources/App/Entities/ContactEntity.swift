import Vapor
import Fluent

final class ContactEntity: Model {
    
    static let schema = "contacts"
    
    @ID(key: "id")
    var id: UUID?
    
    @Field(key: "first_name")
    var firstName: String

    @Field(key: "last_name")
    var lastName: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "message")
    var message: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, firstName: String, lastName: String, email: String, message: String, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.message = message
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: ContactModel.Input) {
        
        self.init(firstName: input.firstName!, lastName: input.lastName!, email: input.email!, message: input.message!)
    }
}
