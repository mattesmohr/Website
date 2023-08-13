import HTMLKit
import HTMLKitComponents

enum ProjectPage {
    
    struct IndexView: View {

        var viewModel: ProjectPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    HStack {
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
        }
    }
    
    struct ShowView: View {

        var viewModel: ProjectPageModel.ShowView

        var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        Text {
                            "Lorem ipsum..."
                        }
                        .fontSize(.large)
                        .fontWeight(.bold)
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
                Section {
                    VStack {
                        Text {
                            viewModel.project.content
                        }
                        Text {
                            "Overview"
                        }
                        Text {
                            "Features"
                        }
                        Text {
                            "Download"
                        }
                    }
                }
            }
        }
    }
}
