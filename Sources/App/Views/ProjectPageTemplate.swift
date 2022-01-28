import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ProjectPageTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ProjectModel.Output>.self) var context

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
                                        "iPhone"
                                    }
                                }
                                TabItem {
                                    Text(transformation: .uppercase) {
                                        "iPad"
                                    }
                                }
                                TabItem {
                                    Text(transformation: .uppercase) {
                                        "Mac"
                                    }
                                }
                                TabItem {
                                    Text(transformation: .uppercase) {
                                        "Safari"
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

        @TemplateValue(ShowContext<ProjectModel.Output>.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .six) {
                            Text(size: .medium) {
                                context.view.title
                            }
                            Text(size: .large, weight: .bold) {
                                "Lorem ipsum..."
                            }
                        }
                        StackColumn(size: .six) {
                            NavigationContainer(direction: .horizontal) {
                                NavigationItem {
                                    NavigationLink(uri: "#overview") {
                                        "Overview"
                                    }
                                }
                                NavigationItem {
                                    NavigationLink(uri: "#features") {
                                        "Features"
                                    }
                                }
                                NavigationItem {
                                    NavigationLink(uri: "#download") {
                                        "Download"
                                    }
                                }
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .vertical) {
                        StackColumn(size: .twelve) {
                            Text {
                                context.item.content
                            }
                        }
                        StackColumn(size: .twelve) {
                            Text {
                                "Overview"
                            }
                        }
                        StackColumn(size: .twelve) {
                            Text {
                                "Features"
                            }
                        }
                        StackColumn(size: .twelve) {
                            Text {
                                "Download"
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
