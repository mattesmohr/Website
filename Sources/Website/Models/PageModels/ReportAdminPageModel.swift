import HTMLKit
import HTMLKitComponents

enum ReportAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedString(key: "Reports")
        let projects: [StatisticEntity]
    }
}
