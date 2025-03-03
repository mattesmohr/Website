import HTMLKit
import HTMLKitComponents

enum ProjectAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Projects")
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedStringKey("Create project")
    }
    
    struct EditView {
        
        let title = LocalizedStringKey("Edit project")
        let project: ProjectModel.Output
    }
}
