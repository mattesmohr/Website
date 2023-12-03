import HTMLKit
import HTMLKitComponents

enum ArticleAdminPage {
    
    struct IndexView: View {

        var viewModel: ArticleAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/articles/create") {
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
                    HStack {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                    .contentSpace(.between)
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
                        ArticleAdminPage.EditForm(article: viewModel.article)
                    }
                }
            }
        }
    }
}
