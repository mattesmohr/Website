import HTMLKit
import HTMLKitComponents

enum ArticlePage {
    
    struct IndexView: View {
        
        var viewModel: ArticlePageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack {
                        Text {
                            viewModel.title
                        }
                        .font(.subheadline)
                        Text {
                            "Lorem ipsum"
                        }
                        .font(.headline)
                    }
                }
                Section {
                    HStack {
                        Text {
                            "Lorem ipsum..."
                        }
                    }
                    HStack {
                        List(direction: .horizontal) {
                            ListRow {
                                Italic {
                                }
                                .class("fas fa-search")
                            }
                            ListRow {
                                Text {
                                    "All"
                                }
                                .fontTransformation(.uppercase)
                            }
                            ListRow {
                                Text {
                                    "Identity"
                                }
                                .fontTransformation(.uppercase)
                            }
                            ListRow {
                                Text {
                                    "Coding"
                                }
                                .fontTransformation(.uppercase)
                            }
                            ListRow {
                                Text {
                                    "Ui/Ux"
                                }
                                .fontTransformation(.uppercase)
                            }
                        }
                        .frame(width: .twelve)
                    }
                    HStack {
                        ArticleGrid(articles: viewModel.pagination.items)
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
                    VStack {
                        Text {
                            viewModel.title
                        }
                    }
                }
                Section {
                    HStack {
                    }
                }
            }
        }
    }
}
