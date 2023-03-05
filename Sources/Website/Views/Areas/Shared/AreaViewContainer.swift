import HTMLKit
import HTMLKitComponents

public struct AreaViewContainer: View {
    
    public let content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    @EnvironmentObject(IdentityMetadata.self)
    var identity

    public var body: Content {
        AreaPageContainer {
            Header {
                HStack {
                    StackColumn(size: .twelve) {
                        Text {
                            "Admin Panel"
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
                                    Symbol(system: "house")
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
                                    Symbol(system: "file")
                                    Link(destination: "/area/admin/articles/index/0") {
                                        "Articles"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "photo")
                                    Link(destination: "/area/admin/assets/index/0") {
                                        "Assets"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "chart.pie")
                                    Link(destination: "/area/admin/reports/index") {
                                        "Report"
                                    }
                                }
                            }
                            ListRow {
                                HTMLKitComponents.Group {
                                    Symbol(system: "person")
                                    Link(destination: "/area/admin/users/index/0") {
                                        "Users"
                                    }
                                }
                            }
                        }
                    }
                    Footer {
                        HStack(alignment: .center) {
                            StackColumn(size: .three) {
                                Text {
                                    identity.name
                                }
                            }
                            StackColumn(size: .six, alignment: .right, offset: .three) {
                                Link(destination: "/area/login/logout") {
                                    "Log out"
                                }
                            }
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
