import HTMLKit
import HTMLKitComponents

enum CommentAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Comments")
        let pagination: Pagination<[CommentModel.Output]>
    }
    
    struct EditView {
        
        let title = LocalizedStringKey("Edit comment")
        let comment: CommentModel.Output
    }
}
