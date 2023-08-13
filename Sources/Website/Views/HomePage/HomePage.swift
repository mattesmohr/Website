import HTMLKit
import HTMLKitComponents

enum HomePage {
    
    struct IndexView: View {

        var viewModel: HomePageModel.IndexView

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
