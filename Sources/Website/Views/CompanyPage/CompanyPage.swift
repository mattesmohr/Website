import HTMLKit
import HTMLKitComponents

enum CompanyPage {
    
    struct IndexView: View {
        
        var viewModel: CompanyPageModel.IndexView
        
        var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .font(.subheadline)
                    }
                }
            }
        }
    }
}
