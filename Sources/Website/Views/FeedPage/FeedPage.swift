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
                    .textStyle(.subheadline)
                }
                Section {
                    Grid(ratio: .third, spacing: .small) {
                        for feed in viewModel.pagination.items {
                            Card {
                                Text {
                                    feed.message
                                }
                            } header: {
                                Image(source: "/assets/mattes-mohr.png")
                            }
                            .borderShape(.smallrounded)
                        }
                    }
                }
            }
        }
    }
}
