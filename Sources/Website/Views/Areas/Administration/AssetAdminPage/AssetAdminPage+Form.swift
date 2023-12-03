import HTMLKit
import HTMLKitComponents

extension AssetAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        "Title"
                    }
                    TextField(name: "title")
                        .borderShape(.smallrounded)
                }
                HStack {
                    Button(role: .submit) {
                        "Submit"
                    }
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
                }
            }
        }
    }
    
    struct EditForm: View {
        
        var asset: AssetModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        "Title"
                    }
                    TextField(name: "title")
                        .borderShape(.smallrounded)
                }
                HStack {
                    Button(role: .submit) {
                        "Submit"
                    }
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
                }
            }
        }
    }
}
