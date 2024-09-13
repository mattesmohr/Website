import HTMLKitComponents

enum UserAdminPageModel {
    
    struct IndexView {
        
        let title: String = "Show users"
        let pagination: Pagination<[UserModel.Output]>
    }
    
    struct CreateView {
        
        let title: String = "Create user"
    }
    
    struct EditView {
        
        let title: String = "Edit user"
        let user: UserModel.Output
    }
}
