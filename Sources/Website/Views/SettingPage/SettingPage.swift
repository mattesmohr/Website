import HTMLKit
import HTMLKitComponents

enum SettingPage {
    
    struct IndexView: View {
        
        var viewModel: SettingPageModel.IndexView

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
                            "Lorem ipsum..."
                        }
                        .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
