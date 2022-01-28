import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum LoginAreaTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text(size: .medium) {
                                "Login"
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
                Footer {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}

