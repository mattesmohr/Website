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
                    }
                }
            }
            Main {
                Aside {
                    List(direction: .vertical) {
                        ListRow {
                            Link(destination: "/area/admin/home/index") {
                                "Home"
                            }
                        }
                        ListRow {
                            Link(destination: "/area/admin/projects/index/0") {
                                "Projects"
                            }
                        }
                        ListRow {
                            Link(destination: "/area/admin/articles/index/0") {
                                "Articles"
                            }
                        }
                        ListRow {
                            Link(destination: "/area/admin/assets/index/0") {
                                "Assets"
                            }
                        }
                        ListRow {
                            Link(destination: "/area/admin/reports/index") {
                                "Report"
                            }
                        }
                        ListRow {
                            Link(destination: "/area/admin/users/index/0") {
                                "Users"
                            }
                        }
                    }
                }
                content
            }
            Footer {
            }
        }
    }
}

