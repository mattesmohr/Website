import HTMLKit
import HTMLKitComponents

struct ProjectList: View {
    
    var projects: [ProjectModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for project in projects {
                    ListRow {
                        HStack {
                            Text {
                                project.title
                            }
                            .frame(width: .four)
                            Text {
                                project.category
                            }
                            .frame(width: .two)
                            Text {
                                project.status
                            }
                            .frame(width: .two)
                            Text {
                                project.modifiedAt.formatted(date: .short, time: .none)
                            }
                            .frame(width: .two)
                            Dropdown {
                                List(direction: .vertical) {
                                    ListRow {
                                        Link(destination: "/area/admin/projects/edit/\(project.id)") {
                                            Symbol(system: "folder")
                                            Text {
                                                "Show"
                                            }
                                        }
                                    }
                                    ListRow {
                                        Link(destination: "/area/admin/projects/edit/\(project.id)") {
                                            Symbol(system: "folder")
                                            Text {
                                                "Edit"
                                            }
                                        }
                                    }
                                    Divider()
                                    ListRow {
                                        Link(destination: "/area/admin/projects/delete/\(project.id)") {
                                            Symbol(system: "folder")
                                            Text {
                                                "Delete"
                                            }
                                        }
                                    }
                                }
                            } label: {
                                Text {
                                    "\u{2981}\u{2981}\u{2981}"
                                }
                            }
                            .frame(width: .two)
                            .borderShape(.smallrounded)
                        }
                    }
                    .padding(insets: .vertical, length: .small)
                }
            }
            .listStyle(.listgroup)
        }
        .borderShape(.smallrounded)
        .margin(insets: .bottom, length: .medium)
    }
}
