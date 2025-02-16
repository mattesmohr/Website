import Fluent
import Foundation

final class SettingEntity: Model, @unchecked Sendable {
    
    static let schema = "settings"
    
    @ID
    var id: UUID?
    
    @OptionalField(key: "site_name")
    var title: String?
    
    @OptionalField(key: "meta_description")
    var description: String?
    
    @OptionalField(key: "site_email")
    var email: String?
    
    @OptionalField(key: "smtp_hostname")
    var hostname: String?
    
    @OptionalField(key: "smtp_port")
    var port: String?
    
    @OptionalField(key: "smtp_security")
    var security: String?
    
    @OptionalField(key: "smtp_username")
    var username: String?
    
    @OptionalField(key: "smtp_password")
    var password: String?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, title: String?, description: String?, email: String?, hostname: String?, port: String?, security: String?, username: String?, password: String?, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.title = title
        self.description = description
        self.email = email
        self.hostname = hostname
        self.port = port
        self.security = security
        self.username = username
        self.password = password
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: SettingModel.Input) {
        
        self.init(title: input.title, description: input.description, email: input.email, hostname: input.hostname, port: input.port, security: input.security, username: input.username, password: input.password)
    }
}
