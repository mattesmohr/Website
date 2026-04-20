import HTMLKit
import HTMLKitComponents

enum FeedPage {
    
    struct IndexView: View {
        
        let viewModel: FeedPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack(spacing: .medium) {
                        Text(viewModel.title)
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
                        for post in viewModel.pagination.items {
                            Card {
                                VStack(spacing: .small) {
                                    if let thumbnail = post.thumbnail {
                                        Image(source: thumbnail.filePath)
                                    }
                                    Text {
                                        post.message
                                    }
                                    .italic()
                                    if let tags = post.tags {
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
                                            post.createdAt.formatted(date: .short, time: .short)
                                        }
                                        .fontSize(.small)
                                    }
                                }
                            }
                            .border(.system, shape: .smallrounded)
                        }
                    }
                }
            }
        }
    }
}
