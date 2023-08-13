import HTMLKit
import HTMLKitComponents

struct ViewContainer: View {
    
    let content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    var body: Content {
        PageContainer {
            Header {
                HStack {
                    Text {
                        "mattesmohr"
                    }
                    .fontSize(.medium)
                    .foregroundColor(.black)
                    .frame(width: .six)
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
                            .tag("explore")
                            .onHover { text in
                                text.show("nav1")
                            }
                        }
                        ListRow {
                            Text {
                                "Read"
                            }
                            .tag("read")
                            .onHover { text in
                                text.show("nav2")
                            }
                        }
                        ListRow {
                            Link(destination: "/connect/index") {
                                "Connect"
                            }
                        }
                    }
                    .frame(width: .six)
                }
                Navigation {
                    HStack(alignment: .top) {
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
                        .frame(width: .three, offset: .six)
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
                        .frame(width: .three, offset: .six)
                    }
                    .tag("stack1")
                    .onLeave { stack in
                        stack.hide("nav1")
                    }
                }
                .id("nav1")
                Navigation {
                    HStack(alignment: .top) {
                        List(direction: .vertical) {
                            ListRow {
                                Text {
                                    "About"
                                }
                                .fontSize(.small)
                            }
                            ListRow {
                                Link(destination: "/articles/index") {
                                    "Articles"
                                }
                            }
                        }
                        .frame(width: .three, offset: .nine)
                    }
                    .tag("stack2")
                    .onLeave { stack in
                        stack.hide("nav2")
                    }
                }
                .id("nav2")
            }
            Main {
                content
            }
            Footer {
                HStack(alignment: .top) {
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
                    .frame(width: .four)
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
                    .frame(width: .four)
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
                    .frame(width: .four)
                }
                HStack {
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
