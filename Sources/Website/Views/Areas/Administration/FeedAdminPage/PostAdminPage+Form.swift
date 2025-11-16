import HTMLKit
import HTMLKitComponents

extension PostAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Message", for: "message")
                    TextEditor(name: "message", prompt: "Message") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(8)
                }
                VStack {
                    FieldLabel("Tags", for: "tags")
                    TextEditor(name: "tags", prompt: "Tags") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(4)
                }
                VStack {
                    FieldLabel("Status", for: "status")
                    SelectField(name: "status", prompt: "Published") {
                        for state in PostModel.PostStatus.allCases {
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
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", PostModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        let post: PostModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Message", for: "message")
                    TextEditor(name: "message", prompt: "Message") {
                        post.message
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(8)
                }
                VStack {
                    FieldLabel("Tags", for: "tags")
                    TextEditor(name: "tags", prompt: "Tags") {
                        post.tags
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(4)
                }
                VStack {
                    FieldLabel("Status", for: "status")
                    SelectField(name: "status", prompt: "Published", selection: post.status.rawValue) {
                        for state in PostModel.PostStatus.allCases {
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
                form.validate("edit-form", PostModel.Input.validators)
            }
        }
    }
}
