import HTMLKit
import HTMLKitComponents

struct PostList: View {
    
    let posts: [PostModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for post in posts {
                    HStack {
                        Text {
                            post.message
                        }
                        .frame(width: .ten)
                        .lineLimit(.one)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/posts/\(post.id)/edit") {
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
                    .padding(insets: .vertical, length: .small)
                }
            }
            .listStyle(.listgroup)
        }
        .border(.system, shape: .smallrounded)
        .margin(insets: .bottom, length: .medium)
    }
}
