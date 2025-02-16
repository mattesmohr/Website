import HTMLKit
import HTMLKitComponents

enum ArticlePageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Articles")
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct ShowView {
        
        let title = LocalizedString(key: "Article")
        let article: ArticleModel.Output
    }
}
