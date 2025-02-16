import HTMLKit
import HTMLKitComponents

enum ProjectAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Projects")
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct CreateView {
        
        let title = LocalizedString(key: "Create project")
    }
    
    struct EditView {
        
        let title = LocalizedString(key: "Edit project")
        let project: ProjectModel.Output
    }
}
