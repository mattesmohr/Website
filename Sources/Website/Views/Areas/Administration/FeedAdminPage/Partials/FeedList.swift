import HTMLKit
import HTMLKitComponents

struct FeedList: View {
    
    var feeds: [FeedModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for feed in feeds {
                    ListRow {
                        HStack {
                            Text {
                                feed.message
                            }
                            .frame(width: .ten)
                            Dropdown {
                                List(direction: .vertical) {
                                    ListRow {
                                        Link(destination: "/area/admin/feed/edit/\(feed.id)") {
                                            Symbol(system: "folder")
                                            Text {
                                                "Edit"
                                            }
                                        }
                                    }
                                }
                            } label: {
                                Text {
                                    "\u{2981}\u{2981}\u{2981}"
                                }
                            }
                            .frame(width: .two)
                            .borderShape(.smallrounded)
                        }
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
