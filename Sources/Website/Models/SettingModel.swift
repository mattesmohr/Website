import HTMLKit
import Vapor

struct SettingModel {
    
    /// An enumeration of potential mail encryptions
    enum MailEncryption: String, CaseIterable, Equatable {
        
        /// Indicates a TLS encryption
        case tls
        
        /// Indicates a SSL encryption
        case ssl
        
        /// Indicates no encryption
        case none
        
        /// The description of the mail encryption
        var description: String {
            
            switch self {
            case .tls:
                return "TLS"
                
            case .ssl:
                return "SSL"
                
            case .none:
                return "None"
            }
        }
        
        /// The localized description of the mail encryption
        var localizedDescription: LocalizedStringKey {
            
            switch self {
            case .tls:
                return "TLS"
                
            case .ssl:
                return "SSL"
                
            case .none:
                return "None"
            }
        }
    }
    
    struct Input: Vapor.Content {
     
        /// The title for the site
        var title: String?
        
        /// The description for the site
        var description: String?
        
        /// The email address for the site
        var email: String?
        
        /// The hostname for smtp
        var hostname: String?
        
        /// The port for smtp
        var port: String?
        
        /// The encryption method for smtp
        var security: String?
        
        /// The username for smtp authentication
        var username: String?
        
        /// The password for smtp authentication
        var password: String?
    }
    
    struct Output {
        
        /// The unique identifier of the setting
        let id: Int
        
        /// The title of the site
        var title: String?
        
        /// The meta description of the site
        var description: String?
        
        /// The email address of the site
        var email: String?
        
        /// The hostname for smtp
        var hostname: String?
        
        /// The port for smtp
        var port: String?
        
        /// The encryption method for smtp
        var security: MailEncryption
        
        /// The username for smtp authentication
        var username: String?
        
        /// The passwort for smtp authentication
        var password: String?
        
        /// The timestamp when the setting was first stored
        let createdAt: Date
        
        /// The timestamp when the setting was last updated
        let modifiedAt: Date
        
        init(id: Int, title: String?, description: String?, email: String?, hostname: String?, port: String?, security: String?, username: String?, password: String?, createdAt: Date, modifiedAt: Date) {
            
            self.id = id
            self.title = title
            self.description = description
            self.email = email
            self.hostname = hostname
            self.port = port
            self.username = username
            self.password = password
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
            
            if let security = security {
                self.security = MailEncryption(rawValue: security)!
            } else {
                self.security = .none
            }
            
        }
        
        init(entity: SettingEntity) {
            
            self.init(id: entity.id!, title: entity.title, description: entity.description, email: entity.email, hostname: entity.hostname, port: entity.port, security: entity.security, username: entity.username, password: entity.password, createdAt: entity.createdAt!, modifiedAt: entity.modifiedAt!)
        }
    }
}
