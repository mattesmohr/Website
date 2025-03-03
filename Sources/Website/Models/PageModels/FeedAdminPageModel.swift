import HTMLKit
import HTMLKitComponents

enum FeedAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Feed")
        let pagination: Pagination<[FeedModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedStringKey("Create feed")
    }
    
    struct EditView {
        
        var title = LocalizedStringKey("Edit feed")
        let feed: FeedModel.Output
    }
}
