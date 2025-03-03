import HTMLKit
import HTMLKitComponents

enum HomePageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Home")
        let pagination: Pagination<[ProjectModel.Output]>
    }
}
