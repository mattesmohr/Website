import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ArticlePageTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ArticleModel.Output>.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text(size: .medium) {
                                context.view.title
                            }
                            Text(size: .large, weight: .bold) {
                                "Lorem ipsum..."
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text {
                                "Lorem ipsum..."
                            }
                        }
                    }
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            TabGroup {
                                TabItem {
                                    Italic {
                                    }
                                    .class("fas fa-search")
                                }
                                TabItem {
                                    Text(transformation: .uppercase) {
                                        "All"
                                    }
                                }
                                TabItem {
                                    Text(transformation: .uppercase) {
                                        "Identity"
                                    }
                                }
                                TabItem {
                                    Text(transformation: .uppercase) {
                                        "Coding"
                                    }
                                }
                                TabItem {
                                    Text(transformation: .uppercase) {
                                        "Ui/Ux"
                                    }
                                }
                            }
                        }
                    }
                    Stack(direction: .horizontal) {
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
                    Stack(direction: .horizontal) {
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
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text(size: .medium, weight: .regular) {
                                context.view.title
                            }
                            Text(size: .large, weight: .regular) {
                                context.item.title
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text {
                                context.item.content
                            }
                        }
                    }
                }
                Footer {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}
