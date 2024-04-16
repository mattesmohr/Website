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
                }
                Section {
                    VStack(spacing: .large) {
                        Text {
                            "Lorem ipsum"
                        }
                        .fontSize(.medium)
                    }
                }
            }
        }
    }
}
