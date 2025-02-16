import HTMLKit
import HTMLKitComponents

struct ViewContainer: View {
    
    let content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    @EnvironmentObject(UserModel.Output.self)
    var identity

    var body: Content {
        PageContainer {
            Environment.unwrap(identity.fullname) { fullname in
                Aside {
                    HStack(spacing: .between) {
                        Link(destination: "/area/admin/home") {
                            Text("Back to the backend")
                        }
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/login/logout") {
                                    Symbol(system: .trash)
                                    Text("Log out")
                                }
                            }
                        } label: {
                            Text {
                                fullname
                            }
                            .foregroundColor(.white)
                        }
                        .backgroundColor(.black)
                        .border(.black)
                    }
                }
            }
            Header {
                HStack(spacing: .between) {
                    Link(destination: "/home") {
                        Text {
                            "mattesmohr"
                        }
                        .fontSize(.medium)
                        .foregroundColor(.black)
                    }
                    .frame(width: .minimum)
                    Navigation {
                        List(direction: .horizontal) {
                            Link(destination: "/home/#about") {
                                Text("About")
                            }
                            Link(destination: "/projects") {
                                Text("Projects")
                            }
                            Link(destination: "/feed") {
                                Text("Feed")
                            }
                            Link(destination: "/articles") {
                                Text("Blog")
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
                        .listSpacing(.large)
                    }
                }
            }
            Main {
                content
            }
            Footer {
                HStack(spacing: .between) {
                    List(direction: .horizontal) {
                        Link(destination: "/home") {
                            Text {
                                "DE"
                            }
                        }
                        Link(destination: "/home") {
                            Text {
                                "EN"
                            }
                        }
                    }
                    .listSpacing(.small)
                    List(direction: .horizontal) {
                        Link(destination: "/legal") {
                            Text("Legal")
                        }
                        Link(destination: "/privacy") {
                            Text("Privacy")
                        }
                    }
                    .listSpacing(.small)
                }
            }
        }
    }
}
