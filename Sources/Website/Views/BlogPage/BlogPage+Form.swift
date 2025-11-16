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
                    .borderShape(.smallrounded)
                    HTMLKit.Input()
                        .type(.hidden)
                        .name("nonce")
                        .custom(key: "value", value: nonce.value)
                    Button("Comment", role: .submit)
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                }
            }
        }
    }
}
