import HTMLKit
import HTMLKitComponents

enum FeedPage {
    
    struct IndexView: View {
        
        var viewModel: FeedPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .font(.subheadline)
                }
                Section {
                    Grid(ratio: .sixth) {
                        Thumbnail {
                        }
                        Thumbnail {
                        }
                        Thumbnail {
                        }
                        Thumbnail {
                        }
                        Thumbnail {
                        }
                    }
                    .contentSpace(.small)
                }
            }
        }
    }
}
