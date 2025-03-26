import HTMLKit
import HTMLKitComponents

extension CommentAdminPage {
    
    struct EditForm: View {
        
        let comment: CommentModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "message") {
                        LocalizedString(key: "Message")
                    }
                    TextEditor(name: "message", prompt: "Message") {
                        comment.message
                    }
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "reply") {
                        LocalizedString(key: "Reply")
                    }
                    TextEditor(name: "reply", prompt: "Reply") {
                        comment.reply
                    }
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "status") {
                        LocalizedString(key: "Status")
                    }
                    SelectField(name: "status", selection: comment.status.rawValue) {
                        for state in CommentModel.CommentStatus.allCases {
                            RadioSelect(value: state.rawValue) {
                                state.description
                            }
                        }
                    }
                    .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button(role: .submit) {
                    LocalizedString(key: "Submit")
                }
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
