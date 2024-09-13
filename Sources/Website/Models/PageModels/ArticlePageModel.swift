import HTMLKitComponents

enum ArticlePageModel {
    
    struct IndexView {
        
        let title: String = "Articles"
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct ShowView {
        
        let title: String = "Article"
        let article: ArticleModel.Output
    }
}
