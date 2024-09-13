import HTMLKitComponents

enum FeedAdminPageModel {
    
    struct IndexView {
        
        let title: String = "Show feed"
        let pagination: Pagination<[FeedModel.Output]>
    }
    
    struct CreateView {
        
        let title: String = "Create feed"
    }
    
    struct EditView {
        
        var title: String = "Edit feed"
        let feed: FeedModel.Output
    }
}
