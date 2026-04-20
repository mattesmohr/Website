import HTMLKit
import HTMLKitComponents

enum HomeAdminPage {
    
    struct IndexView: View {
        
        let viewModel: HomeAdminPageModel.IndexView
        
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
                    Grid(ratio: .third, spacing: .small) {
                        Card {
                        }
                        .border(.system, shape: .smallrounded)
                        Card {
                        }
                        .border(.system, shape: .smallrounded)
                        Card {
                        }
                        .border(.system, shape: .smallrounded)
                    }
                }
                Section {
                }
            }
        }
    }
}
