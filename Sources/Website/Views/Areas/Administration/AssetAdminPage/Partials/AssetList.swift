import HTMLKit
import HTMLKitComponents

struct AssetList: View {
    
    var assets: [AssetModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for asset in assets {
                    HStack {
                        Text {
                            asset.title
                        }
                        .frame(width: .four)
                        .lineLimit(.one)
                        Text {
                            asset.filePath ?? "-"
                        }
                        .frame(width: .four)
                        .lineLimit(.one)
                        Text {
                            asset.fileSize ?? "0 MB"
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
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
                        .borderShape(.smallrounded)
                    }
                    .padding(insets: .vertical, length: .small)
                }
            }
            .listStyle(.listgroup)
        }
        .borderShape(.smallrounded)
        .margin(insets: .bottom, length: .medium)
    }
}
