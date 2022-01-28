import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum UserAdminTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<UserModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
    
    struct CreateView: View {
        
        @TemplateValue(CreateContext<UserModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
    
    struct EditView: View {
        
        @TemplateValue(EditContext<UserModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
}
