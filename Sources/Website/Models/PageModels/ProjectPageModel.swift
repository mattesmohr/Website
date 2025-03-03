import HTMLKit
import HTMLKitComponents

enum ProjectPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Projects")
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct ShowView {
        
        let title = LocalizedStringKey("Project")
        let project: ProjectModel.Output
    }
}
