import HTMLKit
import HTMLKitComponents

struct ArticlePage {
    
    var views: [View] = [IndexView(), ShowView()]
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ArticleModel.Output>.self)
        var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                            Text {
                                "Lorem ipsum..."
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
                            Collection {
                                ForEach(in: context.items) { item in
                                    CollectionItem {
                                        Division {
                                            Division {
                                                Text {
                                                    item.modifiedAt.formatted(string: "EEEE, MMM d, yyyy")
                                                }
                                                Text {
                                                    item.title
                                                }
                                                Text {
                                                    item.content
                                                }
                                            }
                                            .class("article-body")
                                            Division {
                                                Anchor {
                                                    "Read it"
                                                }
                                                .reference("context.route.baseUrl/show/context.item.id")
                                                .class("link forward-indicator")
                                            }
                                            .class("article-footer")
                                        }
                                        .class("article")
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

        @TemplateValue(ShowContext<ArticleModel.Output>.self) var context

        public var body: AnyContent {
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
