import HTMLKit
import HTMLKitComponents

enum BlogPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Blog")
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct ShowView {
        
        let title = LocalizedStringKey("Article")
        let article: ArticleModel.Output
    }
}
