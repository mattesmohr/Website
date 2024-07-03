import HTMLKit
import HTMLKitComponents

struct FeedList: View {
    
    var feeds: [FeedModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for feed in feeds {
                    HStack {
                        Text {
                            feed.message
                        }
                        .frame(width: .ten)
                        .lineLimit(.one)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/feed/\(feed.id)/edit") {
                                    Symbol(system: .pencil)
                                    Text {
                                        "Edit"
                                    }
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
