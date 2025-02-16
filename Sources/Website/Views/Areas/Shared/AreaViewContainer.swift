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
                Section {
                    HStack(spacing: .medium) {
                        Dropdown {
                            List(direction: .vertical) {
                                Text("No notifications")
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
                                    Text("Log out")
                                }
                            }
                        } label: {
                            Text {
                                identity.fullname
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    .frame(width: .maximum)
                    .margin(insets: .leading, length: .auto)
                }
            }
            Main {
                Aside {
                    Section {
                        Navigation {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/home") {
                                    Symbol(system: .house)
                                    Text("Dashboard")
                                }
                                .fontSize(.extralarge)
                                Link(destination: "/area/admin/projects") {
                                    Symbol(system: .folder)
                                    Text("Projects")
                                }
                                Link(destination: "/area/admin/articles") {
                                    Symbol(system: .file)
                                    Text("Articles")
                                }
                                Link(destination: "/area/admin/feed") {
                                    Symbol(system: .scope)
                                    Text("Feed")
                                }
                                Link(destination: "/area/admin/assets") {
                                    Symbol(system: .photo)
                                    Text("Assets")
                                }
                                Link(destination: "/area/admin/reports") {
                                    Symbol(system: .chart(.pie))
                                    Text("Reports")
                                }
                                Link(destination: "/area/admin/users") {
                                    Symbol(system: .person)
                                    Text("Users")
                                }
                                Link(destination: "/area/admin/setting") {
                                    Symbol(system: .tresor)
                                    Text("Setting")
                                }
                            }
                            .listSpacing(.small)
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
