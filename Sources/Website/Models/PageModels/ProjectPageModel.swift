import HTMLKit
import HTMLKitComponents

enum ProjectPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Projects")
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct ShowView {
        
        let title = LocalizedString(key: "Project")
        let project: ProjectModel.Output
    }
}
