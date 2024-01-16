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
                        Link(destination: "/home/index") {
                            "Home"
                        }
                        Link(destination: "/feed/index") {
                            "Feed"
                        }
                        Link(destination: "/articles/index") {
                            "Blog"
                        }
                        Link(destination: "https://github.com/mattesmohr", target: .blank) {
                            Image(source: "/assets/github.svg")
                        }
                        Link(destination: "https://iosdev.space/@mattesmohr", target: .blank) {
                            Image(source: "/assets/mastodon.svg")
                        }
                        Link(destination: "https://www.linkedin.com/mattesmohr", target: .blank) {
                            Image(source: "/assets/linkedin.svg")
                        }
                    }
                    .frame(width: .four)
                }
            }
            Main {
                content
            }
            Footer {
                HStack(spacing: .between) {
                    List(direction: .horizontal) {
                        Link(destination: "/home/index") {
                            "DE"
                        }
                        Link(destination: "/home/index") {
                            "EN"
                        }
                    }
                    List(direction: .horizontal) {
                        Link(destination: "/impressum/index") {
                            Text("menu.legal")
                        }
                        Link(destination: "/privacy/index") {
                            Text("menu.privacy")
                        }
                    }
                }
            }
        }
    }
}
