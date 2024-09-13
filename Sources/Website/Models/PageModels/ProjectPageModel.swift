import HTMLKitComponents

enum ProjectPageModel {
    
    struct IndexView {
        
        let title: String = "Projects"
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct ShowView {
        
        let title: String = "Project"
        let project: ProjectModel.Output
    }
}
