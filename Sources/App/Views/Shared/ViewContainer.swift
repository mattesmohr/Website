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
                                    Span {
                                        "Explore"
                                    }
                                    .class("js_nav_1")
                                }
                                ListRow {
                                    Span {
                                        "Read"
                                    }
                                    .class("js_nav_2")
                                }
                                ListRow {
                                    Link(destination: "/connect/index") {
                                        "Connect"
                                    }
                                }
                            }
                    }
                }
                ZStack {
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
                ZStack {
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
                ZStack {
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
