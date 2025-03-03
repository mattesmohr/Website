import HTMLKit
import HTMLKitComponents

enum FeedPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Feed")
        let pagination: Pagination<[FeedModel.Output]>
    }
}
