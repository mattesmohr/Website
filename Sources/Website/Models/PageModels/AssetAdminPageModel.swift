import HTMLKit
import HTMLKitComponents

enum AssetAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Assets")
        let pagination: Pagination<[AssetModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedStringKey("Create asset")
    }
    
    struct EditView {
        
        let title = LocalizedStringKey("Edit asset")
        let asset: AssetModel.Output
    }
}
