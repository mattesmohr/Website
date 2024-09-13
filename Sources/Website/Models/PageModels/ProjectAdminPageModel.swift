import HTMLKitComponents

enum ProjectAdminPageModel {
    
    struct IndexView {
        
        let title: String = "Show projects"
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct CreateView {
        
        let title: String = "Create project"
    }
    
    struct EditView {
        
        let title: String = "Edit project"
        let project: ProjectModel.Output
    }
}
