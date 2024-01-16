import HTMLKit
import HTMLKitComponents

enum HomeAdminPage {
    
    struct IndexView: View {
        
        var viewModel: HomeAdminPageModel.IndexView
        
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
                    Grid(ratio: .third, spacing: .small) {
                        Card {
                        }
                        .borderShape(.smallrounded)
                        Card {
                        }
                        .borderShape(.smallrounded)
                        Card {
                        }
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                }
            }
        }
    }
}
