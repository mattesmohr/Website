import HTMLKit
import HTMLKitComponents

enum ImpressumPage {
    
    struct IndexView: View {

        var viewModel: ImpressumPageModel.IndexView

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
                        "Lorem ipsum..."
                    }
                    .textStyle(.body)
                }
            }
        }
    }
}
