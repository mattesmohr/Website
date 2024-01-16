import HTMLKitComponents

enum ReportAdminPageModel {
    
    struct IndexView {
        
        let title: String = "Show reports"
        let projects: [StatisticEntity]
    }
}
