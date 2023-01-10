import HTMLKit
import HTMLKitComponents

public struct ViewContainer: View {
    
    public let content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    public var body: Content {
        PageContainer {
            Header {
                HStack {
                    StackColumn(size: .six) {
                        Text {
                            "mattesmohr"
                        }
                        .fontSize(.medium)
                        .foregroundColor(.black)
                    }
                    StackColumn(size: .six, alignment: .right) {
                        List(direction: .horizontal) {
                            ListRow {
                                Link(destination: "/home/index") {
                                    "Home"
                                }
                            }
                            ListRow {
                                Text {
                                    "Explore"
                                }
                                .id("explore")
                                .onHover(perfom: .show("nav1"))
                            }
                            ListRow {
                                Text {
                                    "Read"
                                }
                                .id("read")
                                .onHover(perfom: .show("nav2"))
                            }
                            ListRow {
                                Link(destination: "/connect/index") {
                                    "Connect"
                                }
                            }
                        }
                    }
                }
                Navigation {
                    HStack(alignment: .top) {
                        StackColumn(size: .three, offset: .six) {
                            List(direction: .vertical) {
                                ListRow {
                                    Text {
                                        "Code"
                                    }
                                    .fontSize(.small)
                                }
                                ListRow {
                                    Link(destination: "/projects/index/0") {
                                        "Projects"
                                    }
                                }
                            }
                        }
                        StackColumn(size: .three) {
                            List(direction: .vertical) {
                                ListRow {
                                    Text {
                                        "Company"
                                    }
                                    .fontSize(.small)
                                }
                                ListRow {
                                    Link(destination: "/company/index") {
                                        "Company"
                                    }
                                }
                            }
                        }
                    }
                    .id("stack1")
                    .onLeave(perfom: .hide("nav1"))
                }
                .id("nav1")
                Navigation {
                    HStack(alignment: .top) {
                        StackColumn(size: .three, offset: .nine) {
                            List(direction: .vertical) {
                                ListRow {
                                    Text {
                                        "About"
                                    }
                                    .fontSize(.small)
                                }
                                ListRow {
                                    Link(destination: "/articles/index/0") {
                                        "Articles"
                                    }
                                }
                            }
                        }
                    }
                    .id("stack2")
                    .onLeave(perfom: .hide("nav2"))
                }
                .id("nav2")
            }
            Main {
                content
            }
            Footer {
                HStack(alignment: .top) {
                    StackColumn(size: .four) {
                        List(direction: .vertical) {
                            ListRow {
                                Text {
                                    "Languages"
                                }
                                .fontSize(.small)
                            }
                            ListRow {
                                Link(destination: "#") {
                                    "German"
                                }
                            }
                            ListRow {
                                Link(destination: "#") {
                                    "English"
                                }
                            }
                        }
                    }
                    StackColumn(size: .four) {
                        List(direction: .vertical) {
                            ListRow {
                                Text {
                                    "Sitemap"
                                }
                                .fontSize(.small)
                            }
                            ListRow {
                                Link(destination: "/projects/index/0") {
                                    "Explore solutions"
                                }
                            }
                            ListRow {
                                Link(destination: "/company/index") {
                                    "Read about company"
                                }
                            }
                            ListRow {
                                Link(destination: "/connect/index") {
                                    "Get in touch"
                                }
                            }
                        }
                    }
                    StackColumn(size: .four) {
                        List(direction: .vertical) {
                            ListRow {
                                Text {
                                    "Resources"
                                }
                                .fontSize(.small)
                            }
                            ListRow {
                                Link(destination: "/downloads/index") {
                                    "Downloads"
                                }
                            }
                        }
                    }
                }
                HStack {
                    StackColumn(size: .four, offset: .eight) {
                        List(direction: .horizontal) {
                            ListRow {
                                Link(destination: "/settings/index") {
                                    "Settings"
                                }
                            }
                            ListRow {
                                Link(destination: "/conditions/index") {
                                    "Conditions"
                                }
                            }
                            ListRow {
                                Link(destination: "/impressum/index") {
                                    "Impressum"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
