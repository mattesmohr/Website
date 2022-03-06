import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

public struct ViewContainer: Page {
    
    public let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }

    public var body: AnyContent {
        PageContainer {
            Header {
                HStack {
                    StackColumn(size: .six) {
                        Text {
                            "mattesmohr"
                        }
                        .fontSize(.medium)
                    }
                    StackColumn(size: .six) {
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
                                    Text {
                                        "Connect"
                                    }
                                    .id("connect")
                                    .onHover(perfom: .show("nav3"))
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
                                    Link(destination: "/projects/index") {
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
                                    Link(destination: "/articles/index/") {
                                        "Articles"
                                    }
                                }
                            }
                        }
                    }
                }
                .id("nav2")
                Navigation {
                    HStack(alignment: .top) {
                        StackColumn(size: .three, offset: .six) {
                            List(direction: .vertical) {
                                ListRow {
                                    Text {
                                        "Sites"
                                    }
                                    .fontSize(.small)
                                }
                                ListRow {
                                    Link(destination: "/home/index") {
                                        "Home"
                                    }
                                }
                                ListRow {
                                    Link(destination: "/projects/index") {
                                        "Projects"
                                    }
                                }
                                ListRow {
                                    Link(destination: "/company/index") {
                                        "Company"
                                    }
                                }
                                ListRow {
                                    Link(destination: "/articles/index") {
                                        "Articles"
                                    }
                                }
                                ListRow {
                                    Link(destination: "/connect/index") {
                                        "Connect"
                                    }
                                }
                            }
                        }
                        StackColumn(size: .three) {
                            List(direction: .vertical) {
                                ListRow {
                                    Text {
                                        "Legal"
                                    }
                                    .fontSize(.small)
                                }
                                ListRow {
                                    Link(destination: "/term/index") {
                                        "Terms of use"
                                    }
                                }
                                ListRow {
                                    Link(destination: "/privacy/index")  {
                                        "Privacy policy"
                                    }
                                }
                                ListRow {
                                    Link(destination: "/impressum/index")  {
                                        "Impressum"
                                    }
                                }
                            }
                        }
                    }
                }
                .id("nav3")
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
                                Link(destination: "/projects/index") {
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
                    StackColumn(size: .eight) {
                        Paragraph {
                            "&copy; 2021"
                        }
                    }
                    StackColumn(size: .four) {
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
