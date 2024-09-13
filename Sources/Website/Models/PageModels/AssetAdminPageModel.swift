import HTMLKitComponents

enum AssetAdminPageModel {
    
    struct IndexView {
        
        let title: String = "Show assets"
        let pagination: Pagination<[AssetModel.Output]>
    }
    
    struct CreateView {
        
        let title: String = "Create asset"
    }
    
    struct EditView {
        
        let title: String = "Edit asset"
        let asset: AssetModel.Output
    }
}
