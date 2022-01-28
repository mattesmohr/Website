import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum AssetAdminTemplate {
    
    struct IndexView: View {
        
        @TemplateValue(IndexContext<AssetModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
    
    struct CreateView: View {
        
        @TemplateValue(CreateContext<AssetModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
    
    struct EditView: View {
        
        @TemplateValue(EditContext<AssetModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
}
