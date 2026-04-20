import HTMLKit
import HTMLKitComponents

struct AssetList: View {
    
    let assets: [AssetModel.Output]
    
    var body: Content {
        Grid(ratio: .fifth, spacing: .small) {
            for asset in assets {
                Card {
                    HStack(spacing: .between) {
                        Text {
                            asset.title
                        }
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/assets/\(asset.id)/edit") {
                                    Symbol(system: .pencil)
                                    Text("Edit")
                                }
                            }
                        } label: {
                            Symbol(system: .ellipsis(.horizontal))
                        }
                        .frame(width: .two)
                        .border(.system, shape: .smallrounded)
                    }
                } header: {
                    Image(source: asset.filePath)
                }
                .border(.system, shape: .smallrounded)
            }
        }
        .margin(insets: .bottom, length: .medium)
    }
}
