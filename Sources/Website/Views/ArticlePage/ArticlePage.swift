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
                    .textStyle(.subheadline)
                }
                Section {
                    Grid(ratio: .half, spacing: .small) {
                        for article in viewModel.pagination.items {
                            Link(destination: "/articles/show/\(article.id)") {
                                VStack(spacing: .small) {
                                    Thumbnail {
                                        MacIcon()
                                    }
                                    Text {
                                        if let category = ArticleModel.Categories(rawValue: article.category) {
                                            category.description
                                        }
                                    }
                                    .fontSize(.small)
                                    .foregroundColor(.blue)
                                    .bold()
                                    Text {
                                        article.title
                                    }
                                    .fontSize(.medium)
                                    Text {
                                        article.content
                                    }
                                    .foregroundColor(.gray)
                                    .lineLimit(.three)
                                }
                            }
                        }
                    }
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
                    .textStyle(.subheadline)
                }
                Section {
                    VStack(spacing: .small) {
                        Thumbnail {
                            SafariIcon()
                        }
                        Text {
                            viewModel.article.title
                        }
                        .fontSize(.large)
                        Text {
                            viewModel.article.content
                        }
                        .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
