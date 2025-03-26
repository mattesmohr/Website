import HTMLKit
import HTMLKitComponents

extension ArticlePage {
    
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
                    Button(role: .submit) {
                        LocalizedString(key: "Comment")
                    }
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
                }
            }
        }
    }
}
