import HTMLKitComponents

enum ProjectAdminPageModel {
    
    struct IndexView {
        
        var title: String = "Show projects"
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct CreateView {
        
        var title: String = "Create project"
    }
    
    struct EditView {
        
        var title: String = "Edit project"
        let project: ProjectModel.Output
    }
}
