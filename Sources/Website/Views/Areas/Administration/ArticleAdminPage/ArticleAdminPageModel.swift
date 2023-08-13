import HTMLKitComponents

enum ArticleAdminPageModel {
    
    struct IndexView {
        
        var title: String = "Show articles"
        let pagination: Pagination<[ArticleModel.Output]>
    }
    
    struct CreateView {
        
        var title: String = "Create article"
    }
    
    struct EditView {
        
        var title: String = "Edit article"
        let article: ArticleModel.Output
    }
}
