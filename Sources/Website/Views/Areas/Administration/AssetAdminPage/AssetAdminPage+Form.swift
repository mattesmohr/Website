import HTMLKit
import HTMLKitComponents

extension AssetAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post, encoding: .multipart) {
                VStack {
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Alternate text", for: "alternateText")
                    TextEditor(name: "alternateText") {
                    }
                }
                VStack {
                    FieldLabel("Asset", for: "asset")
                    FileDialog(name: "asset")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
            }
        }
    }
    
    struct EditForm: View {
        
        let asset: AssetModel.Output
        
        var body: Content {
            Form(method: .post, encoding: .multipart) {
                Image(source: asset.filePath)
                    .borderShape(.smallrounded)
                    .border(.system)
                    .backgroundColor(.system)
                    .imageScale(.medium)
                VStack {
                    FieldLabel("Asset", for: "asset")
                    FileDialog(name: "asset")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title", value: asset.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Alternate text", for: "alternateText")
                    TextEditor(name: "alternateText") {
                        asset.alternate
                    }
                    .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
            }
        }
    }
}
