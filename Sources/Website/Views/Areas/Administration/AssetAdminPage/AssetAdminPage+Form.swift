import HTMLKit
import HTMLKitComponents

extension AssetAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post, encoding: .multipart) {
                VStack {
                    FieldLabel(for: "title") {
                        "Title"
                    }
                    TextField(name: "title", prompt: "Title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "asset") {
                        "Asset"
                    }
                    FileDialog(name: "asset")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button(role: .submit) {
                    "Submit"
                }
                .buttonStyle(.primary)
                .borderShape(.smallrounded)
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
                    TextField(name: "title", prompt: "Title", value: asset.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "asset") {
                        "Asset"
                    }
                    FileDialog(name: "asset")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button(role: .submit) {
                    "Submit"
                }
                .buttonStyle(.primary)
                .borderShape(.smallrounded)
            }
        }
    }
}
