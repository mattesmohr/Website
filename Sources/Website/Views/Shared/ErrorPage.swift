import HTMLKit
import HTMLKitComponents

enum ErrorPage {
    
    struct ErrorView: View {
        
        var message: String
        
        var body: Content {
            AreaViewContainer {
                Section {
                    VStack(spacing: .small) {
                        Text {
                            "Ooops!"
                        }
                        .textStyle(.headline)
                        Text("Something went wrong (\(message)). Sorry for the inconvenience!")
                    }
                }
            }
        }
    }
}
