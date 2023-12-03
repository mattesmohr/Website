import HTMLKitComponents

enum FeedPageModel {
    
    struct IndexView {
        
        var title: String = "Feed"
        let pagination: Pagination<[FeedModel.Output]>
    }
}
