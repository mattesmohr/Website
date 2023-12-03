import HTMLKit
import HTMLKitComponents

enum AssetAdminPage {
    
    struct IndexView: View {
        
        var viewModel: AssetAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/assets/create") {
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        var viewModel: AssetAdminPageModel.CreateView
        
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
                        AssetAdminPage.CreateForm()
                    }
                }
            }
        }
    }
    
    struct EditView: View {
        
        var viewModel: AssetAdminPageModel.EditView
        
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
                        AssetAdminPage.EditForm(asset: viewModel.asset)
                    }
                }
            }
        }
    }
}
