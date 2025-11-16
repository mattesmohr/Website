import HTMLKit
import HTMLKitComponents

enum PostAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Posts")
        let pagination: Pagination<[PostModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedStringKey("Create post")
    }
    
    struct EditView {
        
        let title = LocalizedStringKey("Edit post")
        let post: PostModel.Output
    }
}
