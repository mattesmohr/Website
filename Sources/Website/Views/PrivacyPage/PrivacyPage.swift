import HTMLKit
import HTMLKitComponents

enum PrivacyPage {
    
    struct IndexView: View {
        
        var viewModel: PrivacyPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack {
                        Text {
                            viewModel.title
                        }
                        .font(.subheadline)
                        Text {
                            "Lorem ipsum"
                        }
                        .font(.headline)
                    }
                }
                Section {
                    HStack {
                        Text {
                            "Lorem ipsum"
                        }
                        .font(.body)
                    }
                }
            }
        }
    }
}
