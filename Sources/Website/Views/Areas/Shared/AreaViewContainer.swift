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
                }
            }
            Main {
                Aside {
                    Section {
                        Navigation {
                            List(direction: .vertical) {
                                ListRow {
                                    Link(destination: "/area/admin/home/index") {
                                        Symbol(system: "house")
                                        Text {
                                            "Home"
                                        }
                                    }
                                    .fontSize(.extralarge)
                                }
                                ListRow {
                                    Link(destination: "/area/admin/projects/index") {
                                        Symbol(system: "folder")
                                        Text {
                                            "Projects"
                                        }
                                    }
                                }
                                ListRow {
                                    Link(destination: "/area/admin/articles/index") {
                                        Symbol(system: "file")
                                        Text {
                                            "Articles"
                                        }
                                    }
                                }
                                ListRow {
                                    Link(destination: "/area/admin/assets/index") {
                                        Symbol(system: "photo")
                                        Text {
                                            "Assets"
                                        }
                                    }
                                }
                                ListRow {
                                    Link(destination: "/area/admin/reports/index") {
                                        Symbol(system: "chart.pie")
                                        Text {
                                            "Report"
                                        }
                                    }
                                }
                                ListRow {
                                    Link(destination: "/area/admin/users/index") {
                                        Symbol(system: "person")
                                        Text {
                                            "Users"
                                        }
                                    }
                                }
                            }
                        }
                        .navigationStyle(.menu)
                    }
                    Footer {
                        HStack {
                            Text {
                                identity.firstName + identity.lastName
                            }
                            .frame(width: .three)
                            Link(destination: "/area/login/logout") {
                                "Log out"
                            }
                            .frame(width: .six, offset: .three)
                        }
                    }
                }
                Section {
                    content
                }
            }
        }
    }
}
