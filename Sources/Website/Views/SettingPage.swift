import HTMLKit
import HTMLKitComponents

enum SettingPage {
    
    struct IndexView: View {

        var context: EmptyContext

        public var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .font(.subheadline)
                            Text {
                                "Lorem ipsum"
                            }
                            .font(.headline)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                "Lorem ipsum..."
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
                Footer {
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}