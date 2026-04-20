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
                    .border(.system, shape: .smallrounded)
                    .lineLimit(8)
                }
                VStack {
                    FieldLabel("Tags", for: "tags")
                    TextEditor(name: "tags", prompt: "Tags") {
                    }
                    .border(.system, shape: .smallrounded)
                    .lineLimit(4)
                }
                VStack {
                    FieldLabel("Status", for: "status")
                    SelectField(name: "status", prompt: "Published") {
                        for state in PostModel.PostStatus.allCases {
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
                    .border(.system, shape: .smallrounded)
                    .lineLimit(8)
                }
                VStack {
                    FieldLabel("Tags", for: "tags")
                    TextEditor(name: "tags", prompt: "Tags") {
                        post.tags
                    }
                    .border(.system, shape: .smallrounded)
                    .lineLimit(4)
                }
                VStack {
                    FieldLabel("Status", for: "status")
                    SelectField(name: "status", prompt: "Published", selection: post.status.rawValue) {
                        for state in PostModel.PostStatus.allCases {
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
                form.validate("edit-form", PostModel.Input.validators)
            }
        }
    }
}
