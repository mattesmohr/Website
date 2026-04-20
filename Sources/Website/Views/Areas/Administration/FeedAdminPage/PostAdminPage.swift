import HTMLKit
import HTMLKitComponents

enum PostAdminPage {
    
    struct IndexView: View {
        
        let viewModel: PostAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/posts/create") {
                            Symbol(system: .photo)
                            Text("Create")
                        }
                        .buttonStyle(.primary)
                        .border(.system, shape: .smallrounded)
                    }
                }
                Section {
                    PostList(posts: viewModel.pagination.items)
                    HStack(spacing: .between) {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        let viewModel: PostAdminPageModel.CreateView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    Text(viewModel.title)
                        .fontSize(.medium)
                        .fontWeight(.medium)
                }
                Section {
                    PostAdminPage.CreateForm()
                }
            }
        }
    }
    
    struct EditView: View {
        
        let viewModel: PostAdminPageModel.EditView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        Dropdown {
                            List(direction: .vertical) {
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
                        .border(.system, shape: .smallrounded)
                    }
                }
                Section {
                    PostAdminPage.EditForm(post: viewModel.post)
                }
                PostAdminPage.DeleteModal(id: viewModel.post.id)
            }
        }
    }
}
