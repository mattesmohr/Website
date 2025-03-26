import HTMLKit
import HTMLKitComponents

enum ArticlePage {
    
    struct IndexView: View {
        
        let viewModel: ArticlePageModel.IndexView

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
                    Grid(ratio: .third, spacing: .small) {
                        for article in viewModel.pagination.items {
                            Link(destination: "/articles/\(article.slug)") {
                                VStack(spacing: .small) {
                                    Thumbnail {
                                        MacIcon()
                                    }
                                    Text(article.category.localizedDescription)
                                        .fontSize(.small)
                                        .foregroundColor(.accent)
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

        let viewModel: ArticlePageModel.ShowView

        var body: Content {
            ViewContainer {
                Header {
                    Text(viewModel.title)
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
                            .tag("article-content")
                            VStack(spacing: .large) {
                                VStack {
                                    Text("Category")
                                    Text(viewModel.article.category.localizedDescription)
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
                            .tag("article-detail")
                        }
                    }
                    .tag("article")
                }
            }
        }
    }
}
