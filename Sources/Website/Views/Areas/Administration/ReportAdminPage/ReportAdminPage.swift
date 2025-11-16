import HTMLKit
import HTMLKitComponents

enum ReportAdminPage {
    
    struct IndexView: View {
        
        let viewModel: ReportAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                    }
                }
                Section {
                    Card {
                        Chart {
                            for report in viewModel.reports {
                                BarMark(value: report.count, label: report.uri)
                                    .foregroundColor(.random)
                            }
                        }
                    }
                }
            }
        }
    }
}
