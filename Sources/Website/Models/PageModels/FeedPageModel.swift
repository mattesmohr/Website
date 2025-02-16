import HTMLKit
import HTMLKitComponents

enum FeedPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Feed")
        let pagination: Pagination<[FeedModel.Output]>
    }
}
