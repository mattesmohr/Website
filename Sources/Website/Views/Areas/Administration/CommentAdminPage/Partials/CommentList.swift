import HTMLKit
import HTMLKitComponents

struct CommentList: View {
    
    let comments: [CommentModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for comment in comments {
                    HStack {
                        Text {
                            comment.message
                        }
                        .frame(width: .six)
                        .lineLimit(.one)
                        Text(comment.status.localizedDescription)
                        .frame(width: .three)
                        .lineLimit(.one)
                        Text {
                            comment.modifiedAt.formatted(date: .short, time: .short)
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/comments/\(comment.id)/edit") {
                                    Symbol(system: .pencil)
                                    Text("Edit")
                                }
                            }
                        } label: {
                            Symbol(system: .ellipsis(.horizontal))
                        }
                        .frame(width: .one)
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
