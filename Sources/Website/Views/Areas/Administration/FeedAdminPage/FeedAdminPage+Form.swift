import HTMLKit
import HTMLKitComponents

extension FeedAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "message") {
                        "Message"
                    }
                    TextEditor(name: "message") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(8)
                }
                HStack {
                    Button(role: .submit) {
                        "Submit"
                    }
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
                }
            }
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", FeedModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        var feed: FeedModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "message") {
                        "Message"
                    }
                    TextEditor(name: "message") {
                        feed.message
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(8)
                }
                HStack {
                    Button(role: .submit) {
                        "Submit"
                    }
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
                }
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", FeedModel.Input.validators)
            }
        }
    }
}
