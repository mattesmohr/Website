import HTMLKit
import HTMLKitComponents

enum ArticleAdminPage {
    
    struct IndexView: View {

        var viewModel: ArticleAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/articles/create") {
                            Symbol(system: .file)
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    ArticleList(articles: viewModel.pagination.items)
                    HStack(spacing: .between) {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
     
        var viewModel: ArticleAdminPageModel.CreateView
        
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
                        ArticleAdminPage.CreateForm()
                    }
                }
            }
        }
    }
    
    struct EditView: View {
        
        var viewModel: ArticleAdminPageModel.EditView
        
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
                        ArticleAdminPage.EditForm(article: viewModel.article)
                    }
                }
                ArticleAdminPage.DeleteModal(id: viewModel.article.id)
            }
        }
    }
}
