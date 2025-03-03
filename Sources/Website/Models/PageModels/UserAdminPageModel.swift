import HTMLKit
import HTMLKitComponents

enum UserAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Users")
        let pagination: Pagination<[UserModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedStringKey("Create user")
    }
    
    struct EditView {
        
        let title = LocalizedStringKey("Edit user")
        let user: UserModel.Output
    }
}
