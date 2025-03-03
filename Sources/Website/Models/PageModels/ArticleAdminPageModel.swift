import HTMLKit
import HTMLKitComponents

enum ArticleAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Articles")
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedStringKey("Create article")
    }
    
    struct EditView {
        
        let title = LocalizedStringKey("Edit article")
        let article: ArticleModel.Output
    }
}
