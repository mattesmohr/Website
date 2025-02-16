import HTMLKit
import HTMLKitComponents

enum FeedPage {
    
    struct IndexView: View {
        
        var viewModel: FeedPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack(spacing: .medium) {
                        Text {
                            viewModel.title
                        }
                        .textStyle(.subheadline)
                        Text {
                            MarkdownString {
                                "I am absolutly in love with the \(bold: "Swift") language. Especially since its debut on the \(bold: "Server-side"). So expect to read a lot about the language itself, the projects I'm involved in and the insights I encounter along the way."
                            }
                        }
                        .fontSize(.medium)
                    }
                }
                Section {
                    Feed {
                        for feed in viewModel.pagination.items {
                            Card {
                                VStack(spacing: .small) {
                                    if let thumbnail = feed.thumbnail {
                                        Image(source: thumbnail.filePath!)
                                    }
                                    Text {
                                        feed.message
                                    }
                                    .italic()
                                    if let tags = feed.tags {
                                        Text {
                                            tags
                                        }
                                        .foregroundColor(.blue)
                                    }
                                    HStack(spacing: .between) {
                                        Link(destination: "https://www.linkedin.com/mattesmohr", target: .blank) {
                                            Image(source: "/assets/linkedin.svg")
                                        }
                                        Text {
                                            feed.createdAt.formatted(date: .short, time: .short)
                                        }
                                        .fontSize(.small)
                                    }
                                }
                            }
                            .borderShape(.smallrounded)
                        }
                    }
                }
            }
        }
    }
}
