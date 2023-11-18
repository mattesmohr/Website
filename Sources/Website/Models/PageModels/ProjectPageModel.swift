import HTMLKitComponents

enum ProjectPageModel {
    
    struct IndexView {
        
        var title: String = "Projects"
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct ShowView {
        
        var title: String = "Project"
        var project: ProjectModel.Output
    }
}
