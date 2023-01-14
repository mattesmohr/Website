import HTMLKit
import HTMLKitComponents

public struct AreaViewContainer: View {
    
    public let content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    @EnvironmentObject(IdentityMetadata.self)
    var object

    public var body: Content {
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
                                HTMLKitComponents.Group {
                                    Symbol(system: "folder")
                                    Link(destination: "/area/admin/home/index") {
                                        "Home"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "folder")
                                    Link(destination: "/area/admin/projects/index/0") {
                                        "Projects"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "folder")
                                    Link(destination: "/area/admin/articles/index/0") {
                                        "Articles"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "folder")
                                    Link(destination: "/area/admin/assets/index/0") {
                                        "Assets"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "folder")
                                    Link(destination: "/area/admin/reports/index") {
                                        "Report"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "folder")
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
