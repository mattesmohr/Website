import HTMLKit
import HTMLKitComponents

enum ArticlePageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Articles")
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct ShowView {
        
        let title = LocalizedStringKey("Article")
        let article: ArticleModel.Output
    }
}
