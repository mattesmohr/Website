import HTMLKit
import HTMLKitComponents

enum HomePageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Home")
        let pagination: Pagination<[ProjectModel.Output]>
    }
}
