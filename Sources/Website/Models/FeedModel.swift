import Vapor
import HTMLKitComponents

struct FeedModel {
    
    struct Input: Content, Validatable {
        
        var message: String
        
        static func validations(_ validations: inout Validations) {
            
            validations.add("message", as: String.self, is: !.empty)
        }
        
        static let validators = [
            Validator(field: "message", rule: .value)
        ]
    }
    
    struct Output: Content {
        
        var id: UUID
        var message: String
        
        init(id: UUID, message: String) {
            
            self.id = id
            self.message = message
        }
        
        init(entity: FeedEntity) {
            
            self.init(id: entity.id!, message: entity.message)
        }
    }
}
