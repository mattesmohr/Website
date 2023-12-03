import HTMLKitComponents

enum FeedAdminPageModel {
    
    struct IndexView {
        var title: String = "Show feed"
        let pagination: Pagination<[FeedModel.Output]>
    }
    
    struct CreateView {
        var title: String = "Create feed"
    }
    
    struct EditView {
        
        var title: String = "Edit feed"
        let feed: FeedModel.Output
    }
}
