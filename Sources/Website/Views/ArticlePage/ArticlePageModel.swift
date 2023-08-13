import HTMLKitComponents

enum ArticlePageModel {
    
    struct IndexView {
        
        var title: String = "Show articles"
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct ShowView {
        
        var title: String = "Show article"
        let article: ArticleModel.Output
    }
}
