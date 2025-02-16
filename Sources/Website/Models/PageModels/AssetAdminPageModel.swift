import HTMLKit
import HTMLKitComponents

enum AssetAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Assets")
        let pagination: Pagination<[AssetModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedString(key: "Create asset")
    }
    
    struct EditView {
        
        let title = LocalizedString(key: "Edit asset")
        let asset: AssetModel.Output
    }
}
