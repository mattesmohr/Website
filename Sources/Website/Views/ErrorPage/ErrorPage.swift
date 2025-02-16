import HTMLKit
import HTMLKitComponents

enum ErrorPage {
    
    struct ErrorView: View {
        
        var message: String?
        
        var body: Content {
            ViewContainer {
                Section {
                    VStack(spacing: .small) {
                        Text {
                            "Ooops!"
                        }
                        .textStyle(.headline)
                        if let message = message {
                            Text("An error has occured: \(message)")
                        } else {
                            Text("Something went wrong. Sorry for the inconvenience!")
                        }
                    }
                }
            }
        }
    }
}
