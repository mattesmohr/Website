import HTMLKit
import HTMLKitComponents

extension AssetAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post, encoding: .multipart) {
                VStack {
                    FieldLabel(for: "title") {
                        LocalizedString(key: "Title")
                    }
                    TextField(name: "title", prompt: "Title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "asset") {
                        LocalizedString(key: "Asset")
                    }
                    FileDialog(name: "asset")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button(role: .submit) {
                    LocalizedString(key: "Submit")
                }
                .buttonStyle(.primary)
                .borderShape(.smallrounded)
            }
        }
    }
    
    struct EditForm: View {
        
        let asset: AssetModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        LocalizedString(key: "Title")
                    }
                    TextField(name: "title", prompt: "Title", value: asset.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "asset") {
                        LocalizedString(key: "Asset")
                    }
                    FileDialog(name: "asset")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button(role: .submit) {
                    LocalizedString(key: "Submit")
                }
                .buttonStyle(.primary)
                .borderShape(.smallrounded)
            }
        }
    }
}
