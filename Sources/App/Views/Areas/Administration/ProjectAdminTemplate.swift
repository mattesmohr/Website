import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ProjectAdminTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ProjectModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
    
    struct CreateView: View {
        
        @TemplateValue(CreateContext<ProjectModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
    
    struct EditView: View {
     
        @TemplateValue(EditContext<ProjectModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
}
