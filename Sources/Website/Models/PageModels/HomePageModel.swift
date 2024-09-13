import HTMLKitComponents

enum HomePageModel {
    
    struct IndexView {
        
        let title: String = "Home"
        let pagination: Pagination<[ProjectModel.Output]>
    }
}
