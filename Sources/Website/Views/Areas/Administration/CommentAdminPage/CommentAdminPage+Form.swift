import HTMLKit
import HTMLKitComponents

extension CommentAdminPage {
    
    struct EditForm: View {
        
        let comment: CommentModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Message", for: "message")
                    TextEditor(name: "message", prompt: "Message") {
                        comment.message
                    }
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Reply", for: "reply")
                    TextEditor(name: "reply", prompt: "Reply") {
                        comment.reply
                    }
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Status", for: "status")
                    SelectField(name: "status", selection: comment.status.rawValue) {
                        for state in CommentModel.CommentStatus.allCases {
                            RadioSelect(state.localizedDescription, value: state.rawValue)
                        }
                    }
                    .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", CommentModel.Input.Private.validators)
            }
        }
    }
}
