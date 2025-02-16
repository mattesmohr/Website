import HTMLKit
import HTMLKitComponents

enum UserAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Users")
        let pagination: Pagination<[UserModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedString(key: "Create user")
    }
    
    struct EditView {
        
        let title = LocalizedString(key: "Edit user")
        let user: UserModel.Output
    }
}
