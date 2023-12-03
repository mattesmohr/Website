import HTMLKit
import HTMLKitComponents

enum ProjectAdminPage {
    
    struct IndexView: View {

        var viewModel: ProjectAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/projects/create") {
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
                    HStack {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                    .contentSpace(.between)
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
                        ProjectAdminPage.EditForm(project: viewModel.project)
                    }
                }
            }
        }
    }
}
