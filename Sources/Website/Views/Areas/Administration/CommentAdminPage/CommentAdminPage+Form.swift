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
                    .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Reply", for: "reply")
                    TextEditor(name: "reply", prompt: "Reply") {
                        comment.reply
                    }
                    .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Status", for: "status")
                    SelectField(name: "status", selection: comment.status.rawValue) {
                        for state in CommentModel.CommentStatus.allCases {
                            RadioSelect(state.localizedDescription, value: state.rawValue)
                        }
                    }
                    .border(.system, shape: .smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", CommentModel.Input.Private.validators)
            }
        }
    }
}
