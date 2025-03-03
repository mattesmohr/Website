import HTMLKit
import HTMLKitComponents

enum UserAdminPage {
    
    struct IndexView: View {

        let viewModel: UserAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/users/create") {
                            Symbol(system: .person)
                            Text("Create")
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    UserList(users: viewModel.pagination.items)
                    HStack(spacing: .between) {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
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
        
        let viewModel: UserAdminPageModel.CreateView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text(viewModel.title)
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
        
        let viewModel: UserAdminPageModel.EditView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/users/\(viewModel.user.id)/unlock/") {
                                    Symbol(system: .key)
                                    Text("Unlock")
                                }
                                Link(destination: "/area/admin/users/\(viewModel.user.id)/reset/") {
                                    Symbol(system: .key)
                                    Text("Reset")
                                }
                                Grouping {
                                    Symbol(system: .trash)
                                    Text("Delete")
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
                        UserAdminPage.EditForm(user: viewModel.user)
                    }
                }
                UserAdminPage.DeleteModal(id: viewModel.user.id)
            }
        }
    }
}
