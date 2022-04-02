import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

public struct AreaViewContainer: Page {
    
    public let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }

    public var body: AnyContent {
        AreaPageContainer {
            Header {
                HStack {
                    StackColumn(size: .twelve) {
                        Text {
                            "mattesmohr"
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    }
                }
            }
            Main {
                Aside {
                    Section {
                        List(direction: .vertical) {
                            ListRow {
                                Group {
                                    Symbol(name: "house")
                                    Link(destination: "/area/admin/home/index") {
                                        "Home"
                                    }
                                }
                            }
                            ListRow {
                                Group {
                                    Symbol(name: "folder")
                                    Link(destination: "/area/admin/projects/index/0") {
                                        "Projects"
                                    }
                                }
                            }
                            ListRow {
                                Group {
                                    Symbol(name: "folder")
                                    Link(destination: "/area/admin/articles/index/0") {
                                        "Articles"
                                    }
                                }
                            }
                            ListRow {
                                Group {
                                    Symbol(name: "folder")
                                    Link(destination: "/area/admin/assets/index/0") {
                                        "Assets"
                                    }
                                }
                            }
                            ListRow {
                                Group {
                                    Symbol(name: "pie-chart")
                                    Link(destination: "/area/admin/reports/index") {
                                        "Report"
                                    }
                                }
                            }
                            ListRow {
                                Group {
                                    Symbol(name: "people")
                                    Link(destination: "/area/admin/users/index/0") {
                                        "Users"
                                    }
                                }
                            }
                        }
                    }
                    Footer {
                        Link(destination: "/area/login/logout") {
                            "Log out"
                        }
                    }
                }
                Section {
                    content
                }
            }
        }
    }
}
