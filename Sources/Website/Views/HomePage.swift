import HTMLKit
import HTMLKitComponents

enum HomePage {
    
    struct IndexView: View {

        var context: EmptyContext

        public var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve, alignment: .right) {
                            Text {
                                "Welcome"
                            }
                            .font(.subheadline)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
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
