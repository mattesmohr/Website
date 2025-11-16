import HTMLKit
import HTMLKitComponents

enum ReportAdminPageModel {
    
    struct IndexView {
        
        let title = LocalizedStringKey("Reports")
        let reports: [ReportModel.Output]
    }
}
