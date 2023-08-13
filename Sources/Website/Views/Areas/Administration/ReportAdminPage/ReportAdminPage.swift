import HTMLKit
import HTMLKitComponents

enum ReportAdminPage {
    
    struct IndexView: View {
        
        var viewModel: ReportAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                    }
                }
            }
        }
    }
}
