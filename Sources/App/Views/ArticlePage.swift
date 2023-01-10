import HTMLKit
import HTMLKitComponents

enum ArticlePage {
    
    struct IndexView: View {
        
        var context: IndexContext<ArticleModel.Output>

        public var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .font(.subheadline)
                            Text {
                                "Lorem ipsum"
                            }
                            .font(.headline)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                "Lorem ipsum..."
                            }
                        }
                    }
                    HStack {
                        StackColumn(size: .twelve) {
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
                        }
                    }
                    HStack {
                        StackColumn(size: .twelve) {
                            Grid {
                                for item in context.items {
                                    GridItem {
                                        Text {
                                            item.modifiedAt.formatted(date: .complete, time: .complete)
                                        }
                                        Text {
                                            item.title
                                        }
                                        Text {
                                            item.content
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Footer {
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }

    struct ShowView: View {

        var context: ShowContext<ArticleModel.Output>

        public var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            Text {
                                context.item.title
                            }
                            .fontSize(.large)
                            .bold()
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.item.content
                            }
                        }
                    }
                }
                Footer {
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}
