import HTMLKit
import HTMLKitComponents

extension BlogPage {
    
    struct CommentForm: View {
        
        @EnvironmentObject(Nonce.self)
        var nonce
        
        var body: Content {
            Form(method: .post) {
                VStack(spacing: .small) {
                    TextEditor(name: "message") {
                    }
                    .border(.system, shape: .smallrounded)
                    HTMLKit.Input()
                        .type(.hidden)
                        .name("nonce")
                        .custom(key: "value", value: nonce.value)
                    Button("Comment", role: .submit)
                        .buttonStyle(.primary)
                        .border(.system, shape: .smallrounded)
                }
            }
        }
    }
}
