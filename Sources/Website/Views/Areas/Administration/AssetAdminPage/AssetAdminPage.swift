import HTMLKit
import HTMLKitComponents

enum AssetAdminPage {
    
    struct IndexView: View {
        
        let viewModel: AssetAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/assets/create") {
                            Symbol(system: .photo)
                            Text("Create")
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    AssetList(assets: viewModel.pagination.items)
                    HStack(spacing: .between) {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        let viewModel: AssetAdminPageModel.CreateView
        
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
                    AssetAdminPage.CreateForm()
                }
            }
        }
    }
    
    struct EditView: View {
        
        let viewModel: AssetAdminPageModel.EditView
        
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
                    AssetAdminPage.EditForm(asset: viewModel.asset)
                }
                AssetAdminPage.DeleteModal(id: viewModel.asset.id)
            }
        }
    }
}
