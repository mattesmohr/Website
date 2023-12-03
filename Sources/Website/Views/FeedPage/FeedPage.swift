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
                    Grid(ratio: .custom("masonary")) {
                        for feed in viewModel.pagination.items {
                            Card {
                                feed.message
                            }
                            .borderShape(.smallrounded)
                        }
                    }
                    .contentSpace(.small)
                }
            }
        }
    }
}
