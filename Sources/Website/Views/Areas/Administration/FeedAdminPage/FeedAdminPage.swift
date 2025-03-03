import HTMLKit
import HTMLKitComponents

enum FeedAdminPage {
    
    struct IndexView: View {
        
        let viewModel: FeedAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/feed/create") {
                            Symbol(system: .photo)
                            Text("Create")
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    FeedList(feeds: viewModel.pagination.items)
                    HStack(spacing: .between) {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        let viewModel: FeedAdminPageModel.CreateView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    Text(viewModel.title)
                        .fontSize(.medium)
                        .fontWeight(.medium)
                }
                Section {
                    FeedAdminPage.CreateForm()
                }
            }
        }
    }
    
    struct EditView: View {
        
        let viewModel: FeedAdminPageModel.EditView
        
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
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    FeedAdminPage.EditForm(feed: viewModel.feed)
                }
                FeedAdminPage.DeleteModal(id: viewModel.feed.id)
            }
        }
    }
}
