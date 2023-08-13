import HTMLKitComponents

enum ProjectPageModel {
    
    struct IndexView {
        
        var title: String?
        let pagination: Pagination<[ProjectModel.Output]>
    }
    
    struct ShowView {
        
        var title: String?
        var project: ProjectModel.Output
    }
}
