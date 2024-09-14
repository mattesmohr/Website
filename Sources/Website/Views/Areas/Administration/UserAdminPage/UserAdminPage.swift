import HTMLKit
import HTMLKitComponents

enum UserAdminPage {
    
    struct IndexView: View {

        var viewModel: UserAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/users/create") {
                            Symbol(system: .person)
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
                    HStack(spacing: .between) {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/users/\(viewModel.user.id)/unlock/") {
                                    Symbol(system: .key)
                                    Text("action.unlock")
                                }
                                Link(destination: "/area/admin/users/\(viewModel.user.id)/reset/") {
                                    Symbol(system: .key)
                                    Text("action.reset")
                                }
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
                        UserAdminPage.EditForm(user: viewModel.user)
                    }
                }
                UserAdminPage.DeleteModal(id: viewModel.user.id)
            }
        }
    }
}
