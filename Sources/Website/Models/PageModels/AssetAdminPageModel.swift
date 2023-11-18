import HTMLKitComponents

enum AssetAdminPageModel {
    
    struct IndexView {
        
        var title: String = "Show assets"
        let pagination: Pagination<[AssetModel.Output]>
    }
    
    struct CreateView {
        
        var title: String = "Create asset"
    }
    
    struct EditView {
        
        var title: String = "Edit asset"
        let asset: AssetModel.Output
    }
}
