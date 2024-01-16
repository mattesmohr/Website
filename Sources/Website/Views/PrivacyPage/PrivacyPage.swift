import HTMLKit
import HTMLKitComponents

enum PrivacyPage {
    
    struct IndexView: View {
        
        var viewModel: PrivacyPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .textStyle(.subheadline)
                    Text {
                        "Lorem ipsum"
                    }
                    .textStyle(.headline)
                }
                Section {
                    Text {
                        "Lorem ipsum"
                    }
                    .textStyle(.body)
                }
            }
        }
    }
}
