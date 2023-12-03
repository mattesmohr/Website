import HTMLKit
import HTMLKitComponents

enum FeedAdminPage {
    
    struct IndexView: View {
        
        var viewModel: FeedAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        LinkButton(destination: "/area/admin/feed/create") {
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    FeedList(feeds: viewModel.pagination.items)
                    HStack {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                    .contentSpace(.between)
                }
            }
        }
    }
    
    struct CreateView: View {
        
        var viewModel: FeedAdminPageModel.CreateView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
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
        
        var viewModel: FeedAdminPageModel.EditView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .fontSize(.medium)
                    .fontWeight(.medium)
                }
                Section {
                    FeedAdminPage.EditForm(feed: viewModel.feed)
                }
            }
        }
    }
}
