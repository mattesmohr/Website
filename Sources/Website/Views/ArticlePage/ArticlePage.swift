import HTMLKit
import HTMLKitComponents

enum ArticlePage {
    
    struct IndexView: View {
        
        var viewModel: ArticlePageModel.IndexView

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
                                "I am absolutly in love with the **Swift** language. Especially since its debut on the **Server-side**. So expect to read a lot about the language itself, the projects I'm involved in and the insights I encounter along the way."
                            }
                        }
                        .fontSize(.medium)
                    }
                }
                Section {
                    Grid(ratio: .half, spacing: .small) {
                        for article in viewModel.pagination.items {
                            Link(destination: "/articles/\(article.slug)") {
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
                                        article.excerpt
                                    }
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
                    VStack(spacing: .large) {
                        Thumbnail {
                            SafariIcon()
                        }
                        HStack(alignment: .top, spacing: .large) {
                            VStack(spacing: .small) {
                                Text {
                                    viewModel.article.title
                                }
                                .fontSize(.large)
                                Text {
                                    MarkdownString(viewModel.article.content)
                                }
                                .fontSize(.medium)
                            }
                            .frame(width: .nine)
                            VStack(spacing: .large) {
                                VStack {
                                    Text("Category")
                                    Text {
                                        if let category = ProjectModel.Categories(rawValue: viewModel.article.category) {
                                            category.description
                                        }
                                    }
                                    .bold()
                                }
                                if let publishedOn = viewModel.article.publishedOn {
                                    VStack {
                                        Text("Date")
                                        Text {
                                            publishedOn.formatted(date: .long, time: .none)
                                        }
                                        .bold()
                                    }
                                }
                            }
                            .frame(width: .three)
                        }
                    }
                }
            }
        }
    }
}
