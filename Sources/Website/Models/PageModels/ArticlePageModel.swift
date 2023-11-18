import HTMLKitComponents

enum ArticlePageModel {
    
    struct IndexView {
        
        var title: String = "Articles"
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct ShowView {
        
        var title: String = "Article"
        let article: ArticleModel.Output
    }
}
