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
                    .frame(width: .eight)
                    List(direction: .horizontal) {
                        ListRow {
                            Link(destination: "/home/index") {
                                "Home"
                            }
                        }
                        ListRow {
                            Link(destination: "/feed/index") {
                                "Feed"
                            }
                        }
                        ListRow {
                            Link(destination: "/articles/index") {
                                "Blog"
                            }
                        }
                        ListRow {
                            Link(destination: "https://github.com/mattesmohr", target: .blank) {
                                Image(source: "/assets/github.svg")
                            }
                        }
                        ListRow {
                            Link(destination: "https://iosdev.space/@mattesmohr", target: .blank) {
                                Image(source: "/assets/mastodon.svg")
                            }
                        }
                    }
                    .frame(width: .four)
                }
            }
            Main {
                content
            }
            Footer {
                HStack {
                    List(direction: .horizontal) {
                        ListRow {
                            Link(destination: "/home/index") {
                                "DE"
                            }
                        }
                        ListRow {
                            Link(destination: "/home/index") {
                                "EN"
                            }
                        }
                    }
                    List(direction: .horizontal) {
                        ListRow {
                            Link(destination: "/impressum/index") {
                                Text("menu.legal")
                            }
                        }
                        ListRow {
                            Link(destination: "/privacy/index") {
                                Text("menu.privacy")
                            }
                        }
                    }
                }
                .contentSpace(.between)
            }
        }
    }
}
