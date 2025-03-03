import HTMLKit
import HTMLKitComponents

enum SettingAdminPage {
    
    struct CreateView: View {
        
        let viewModel: SettingAdminPageModel.CreateViewModel
        
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
                        SettingAdminPage.CreateForm()
                    }
                }
            }
        }
    }
    
    struct EditView: View {
        
        let viewModel: SettingAdminPageModel.EditViewModel
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack(spacing: .between) {
                        Text(viewModel.title)
                            .fontSize(.medium)
                            .fontWeight(.medium)
                    }
                }
                Section {
                    Section {
                        VStack {
                            SettingAdminPage.EditForm(settings: viewModel.settings)
                        }
                    }
                }
            }
        }
    }
}
