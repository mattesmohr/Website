import HTMLKit
import HTMLKitComponents

enum ArticleAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Articles")
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedString(key: "Create article")
    }
    
    struct EditView {
        
        let title = LocalizedString(key: "Edit article")
        let article: ArticleModel.Output
    }
}
