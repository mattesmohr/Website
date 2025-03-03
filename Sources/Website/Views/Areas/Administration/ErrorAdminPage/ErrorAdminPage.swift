import HTMLKit
import HTMLKitComponents

enum ErrorAdminPage {
    
    struct ErrorView: View {
        
        let message: String
        
        var body: Content {
            AreaViewContainer {
                Section {
                    VStack(spacing: .small) {
                        Text {
                            "Ooops!"
                        }
                        .textStyle(.headline)
                        Text("An error has occured: \(message)")
                    }
                }
            }
        }
    }
}
