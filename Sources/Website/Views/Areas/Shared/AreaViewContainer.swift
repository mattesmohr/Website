import HTMLKit
import HTMLKitComponents

struct AreaViewContainer: View {
    
    let content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    @EnvironmentObject(UserModel.Output.self)
    var identity

    var body: Content {
        AreaPageContainer {
            Header {
                HStack {
                    Text {
                        "Admin Panel"
                    }
                    .fontSize(.medium)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    HStack(spacing: .medium) {
                        Dropdown {
                            List(direction: .vertical) {
                                Text {
                                    "No notifications yet."
                                }
                            }
                            .listStyle(.listgroup)
                        } label: {
                            Symbol(system: .bell)
                        }
                        .borderShape(.smallrounded)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/login/logout") {
                                    Symbol(system: .trash)
                                    Text {
                                        "Log out"
                                    }
                                }
                            }
                        } label: {
                            Text {
                                identity.fullname
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    .frame(width: .minimum)
                    .margin(insets: .leading, length: .auto)
                }
            }
            Main {
                Aside {
                    Section {
                        Navigation {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/home/index") {
                                    Symbol(system: .house)
                                    Text("menu.home")
                                }
                                .fontSize(.extralarge)
                                Link(destination: "/area/admin/projects/index") {
                                    Symbol(system: .folder)
                                    Text("menu.projects")
                                }
                                Link(destination: "/area/admin/articles/index") {
                                    Symbol(system: .file)
                                    Text("menu.articles")
                                }
                                Link(destination: "/area/admin/feed/index") {
                                    Symbol(system: .scope)
                                    Text("menu.feed")
                                }
                                Link(destination: "/area/admin/assets/index") {
                                    Symbol(system: .photo)
                                    Text("menu.assets")
                                }
                                Link(destination: "/area/admin/reports/index") {
                                    Symbol(system: .chart(.pie))
                                    Text("menu.reports")
                                }
                                Link(destination: "/area/admin/users/index") {
                                    Symbol(system: .person)
                                    Text("menu.users")
                                }
                            }
                        }
                        .navigationStyle(.menu)
                    }
                    Footer {
                    }
                }
                Section {
                    content
                }
            }
        }
    }
}
