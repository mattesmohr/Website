import HTMLKit
import HTMLKitComponents

struct CommentView: View {
    
    let comment: CommentModel.Output
    
    var body: Content {
        VStack(spacing: .small) {
            VStack {
                HStack(spacing: .small) {
                    Text {
                        comment.name
                    }
                    Text {
                        comment.createdAt.formatted(unit: .short)
                    }
                    .textStyle(.footnote)
                }
                Text {
                    comment.message
                }
            }
            if let reply = comment.reply {
                if !reply.isEmpty {
                    VStack {
                        HStack(spacing: .small) {
                            Text {
                                "mattesmohr"
                            }
                            .foregroundColor(.accent)
                            Text {
                                comment.modifiedAt.formatted(unit: .short)
                            }
                            .textStyle(.footnote)
                        }
                        Text {
                            reply
                        }
                    }
                    .margin(insets: .leading, length: .medium)
                }
            }
        }
    }
}
