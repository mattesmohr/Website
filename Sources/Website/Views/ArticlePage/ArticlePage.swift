import HTMLKit
import HTMLKitComponents

enum ArticlePage {
    
    struct IndexView: View {
        
        var viewModel: ArticlePageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .font(.subheadline)
                }
                Section {
                    Grid(ratio: .half) {
                        for article in viewModel.pagination.items {
                            Link(destination: "/articles/show/\(article.id)") {
                                VStack {
                                    Thumbnail {
                                        SafariIcon()
                                    }
                                    Text {
                                        article.category
                                    }
                                    .fontSize(.small)
                                    .foregroundColor(.blue)
                                    .bold()
                                    Text {
                                        article.title
                                    }
                                    .bold()
                                    Text {
                                        article.excerpt
                                    }
                                }
                                .contentSpace(.small)
                            }
                        }
                    }
                    .contentSpace(.small)
                }
            }
        }
    }

    struct ShowView: View {

        var viewModel: ArticlePageModel.ShowView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .font(.subheadline)
                    Text {
                        viewModel.article.title
                    }
                    .font(.headline)
                }
                Section {
                    HStack(alignment: .top) {
                        VStack {
                            Thumbnail {
                                SafariIcon()
                            }
                            Text {
                                viewModel.article.content
                            }
                        }
                        .frame(width: .eight)
                        .contentSpace(.small)
                        VStack {
                            Text {
                                "Related Topcis"
                            }
                            .bold()
                            HStack {
                                Thumbnail {
                                    SafariIcon()
                                }
                                Text {
                                    "Headline"
                                }
                                .bold()
                                Text {
                                    "This is a subheadline"
                                }
                            }
                        }
                        .frame(width: .four)
                    }
                }
            }
        }
    }
}
