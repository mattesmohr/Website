import HTMLKit
import HTMLKitComponents

extension FeedAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "message") {
                        LocalizedString(key: "Message")
                    }
                    TextEditor(name: "message", prompt: "Message") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(8)
                }
                VStack {
                    FieldLabel(for: "tags") {
                        LocalizedString(key: "Tags")
                    }
                    TextEditor(name: "tags", prompt: "Tags") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(4)
                }
                VStack {
                    FieldLabel(for: "status") {
                        LocalizedString(key: "Status")
                    }
                    SelectField(name: "status", prompt: "Published") {
                        for state in ArticleModel.States.allCases {
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
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", FeedModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        let feed: FeedModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "message") {
                        LocalizedString(key: "Message")
                    }
                    TextEditor(name: "message", prompt: "Message") {
                        feed.message
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(8)
                }
                VStack {
                    FieldLabel(for: "tags") {
                        LocalizedString(key: "Tags")
                    }
                    TextEditor(name: "tags", prompt: "Tags") {
                        feed.tags
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(4)
                }
                VStack {
                    FieldLabel(for: "status") {
                        LocalizedString(key: "Status")
                    }
                    SelectField(name: "status", prompt: "Published", selection: feed.status) {
                        for state in ArticleModel.States.allCases {
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
                form.validate("edit-form", FeedModel.Input.validators)
            }
        }
    }
}
