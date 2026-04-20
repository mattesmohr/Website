import HTMLKit
import HTMLKitComponents

extension AssetAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post, encoding: .multipart) {
                VStack {
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title")
                        .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Alternate Text", for: "alternateText")
                    TextEditor(name: "alternateText") {
                    }
                }
                VStack {
                    FieldLabel("Asset", for: "asset")
                    FileDialog(name: "asset")
                        .border(.system, shape: .smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
        }
    }
    
    struct EditForm: View {
        
        let asset: AssetModel.Output
        
        var body: Content {
            Form(method: .post, encoding: .multipart) {
                Image(source: asset.filePath)
                    .border(.system, shape: .smallrounded)
                    .border(.system)
                    .background(.system)
                    .imageScale(.medium)
                VStack {
                    FieldLabel("Asset", for: "asset")
                    FileDialog(name: "asset")
                        .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title", value: asset.title)
                        .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Alternate Text", for: "alternateText")
                    TextEditor(name: "alternateText") {
                        asset.alternate
                    }
                    .border(.system, shape: .smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
        }
    }
}
