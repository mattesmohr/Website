import HTMLKit
import HTMLKitComponents

enum FeedAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Feed")
        let pagination: Pagination<[FeedModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedString(key: "Create feed")
    }
    
    struct EditView {
        
        var title = LocalizedString(key: "Edit feed")
        let feed: FeedModel.Output
    }
}
