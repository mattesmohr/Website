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
                    Grid(ratio: .third) {
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
                    .contentSpace(.small)
                }
            }
        }
    }
}
