import HTMLKit
import HTMLKitComponents

enum ProjectAdminPage {
    
    struct IndexView: View {

        var viewModel: ProjectAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/projects/create") {
                            Symbol(system: .folder)
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    ProjectList(projects: viewModel.pagination.items)
                    HStack(spacing: .between) {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        var viewModel: ProjectAdminPageModel.CreateView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                    }
                }
                Section {
                    VStack {
                        ProjectAdminPage.CreateForm()
                    }
                }
            }
        }
    }
    
    struct EditView: View {
     
        var viewModel: ProjectAdminPageModel.EditView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        Dropdown {
                            List(direction: .vertical) {
                                Grouping {
                                    Symbol(system: .trash)
                                    Text {
                                        "Delete"
                                    }
                                    .tag("delete")
                                    .onClick { action in
                                        action.open("delete-modal")
                                    }
                                }
                                .foregroundColor(.red)
                            }
                        } label: {
                            Button(role: .button) {
                                Symbol(system: .ellipsis(.vertical))
                            }
                            .buttonStyle(ControlButton())
                        }
                        .borderShape(.smallrounded)

                    }
                }
                Section {
                    VStack {
                        ProjectAdminPage.EditForm(project: viewModel.project)
                    }
                }
                ProjectAdminPage.DeleteModal(id: viewModel.project.id)
            }
        }
    }
}
