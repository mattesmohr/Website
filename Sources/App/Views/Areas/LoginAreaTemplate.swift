import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum LoginAreaTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                "Login"
                            }
                            .fontSize(.medium)
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

