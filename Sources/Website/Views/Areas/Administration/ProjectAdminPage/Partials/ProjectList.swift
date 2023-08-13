import HTMLKit
import HTMLKitComponents

struct ProjectList: View {
    
    var projects: [ProjectModel.Output]
    
    var body: Content {
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
                            Symbol(system: "actions")
                        }
                        .frame(width: .two)
                        .borderShape(.smallrounded)
                    }
                }
            }
        }
        .listStyle(.listgroup)
        .frame(width: .twelve)
    }
}
