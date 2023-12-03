import HTMLKit
import HTMLKitComponents

enum UserAdminPage {
    
    struct IndexView: View {

        var viewModel: UserAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/users/create") {
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    UserList(users: viewModel.pagination.items)
                    HStack {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                    .contentSpace(.between)
                }
                Aside {
                }
                Footer {
                    HStack {
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        var viewModel: UserAdminPageModel.CreateView
        
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
                        UserAdminPage.CreateForm()
                    }
                }
            }
        }
    }
    
    struct EditView: View {
        
        var viewModel: UserAdminPageModel.EditView
        
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
                        UserAdminPage.EditForm(user: viewModel.user)
                    }
                }
            }
        }
    }
}
