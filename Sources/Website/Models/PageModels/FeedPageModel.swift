import HTMLKitComponents

enum FeedPageModel {
    
    struct IndexView {
        
        let title: String = "Feed"
        let pagination: Pagination<[FeedModel.Output]>
    }
}
