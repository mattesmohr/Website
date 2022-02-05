import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ProjectPageTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ProjectModel.Output>.self) var context

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
                            .fontWeight(.bold)
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
                                        "iPhone"
                                    }
                                    .fontTransformation(.uppercase)
                                }
                                ListRow {
                                    Text {
                                        "iPad"
                                    }
                                    .fontTransformation(.uppercase)
                                }
                                ListRow {
                                    Text {
                                        "Mac"
                                    }
                                    .fontTransformation(.uppercase)
                                }
                                ListRow {
                                    Text {
                                        "Safari"
                                    }
                                    .fontTransformation(.uppercase)
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

        @TemplateValue(ShowContext<ProjectModel.Output>.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .six) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                            Text {
                                "Lorem ipsum..."
                            }
                            .fontSize(.large)
                            .fontWeight(.bold)
                        }
                        StackColumn(size: .six) {
                            List(direction: .horizontal) {
                                ListRow {
                                    Link(destination: "#overview") {
                                        "Overview"
                                    }
                                }
                                ListRow {
                                    Link(destination: "#features") {
                                        "Features"
                                    }
                                }
                                ListRow {
                                    Link(destination: "#download") {
                                        "Download"
                                    }
                                }
                            }
                        }
                    }
                }
                Section {
                    VStack {
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
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}
