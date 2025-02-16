import HTMLKit
import HTMLKitComponents

struct ProjectList: View {
    
    var projects: [ProjectModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for project in projects {
                    HStack {
                        Text {
                            project.title
                        }
                        .frame(width: .four)
                        .lineLimit(.one)
                        Text {
                            if let category = ProjectModel.Categories(rawValue: project.category) {
                                category.description
                            }
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Text {
                            if let state = ProjectModel.States(rawValue: project.status) {
                                state.description
                            }
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Text {
                            project.modifiedAt.formatted(date: .short, time: .none)
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/projects/\(project.id)/edit") {
                                    Symbol(system: .pencil)
                                    Text("Edit")
                                }
                            }
                        } label: {
                            Symbol(system: .ellipsis(.horizontal))
                        }
                        .frame(width: .two)
                        .borderShape(.smallrounded)
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
