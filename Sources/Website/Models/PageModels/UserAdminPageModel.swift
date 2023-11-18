import HTMLKitComponents

enum UserAdminPageModel {
    
    struct IndexView {
        
        var title: String = "Show users"
        let pagination: Pagination<[UserModel.Output]>
    }
    
    struct CreateView {
        
        var title: String = "Create user"
    }
    
    struct EditView {
        
        var title: String = "Edit user"
        let user: UserModel.Output
    }
}
