import HTMLKit
import HTMLKitComponents

enum ImpressumPage {
    
    struct IndexView: View {

        var viewModel: ImpressumPageModel.IndexView

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
                        .font(.body)
                    }
                }
            }
        }
    }
}
