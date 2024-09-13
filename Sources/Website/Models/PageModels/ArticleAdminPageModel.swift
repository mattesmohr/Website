import HTMLKitComponents

enum ArticleAdminPageModel {
    
    struct IndexView {
        
        let title: String = "Show articles"
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct CreateView {
        
        let title: String = "Create article"
    }
    
    struct EditView {
        
        let title: String = "Edit article"
        let article: ArticleModel.Output
    }
}
