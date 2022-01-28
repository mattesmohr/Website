import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum PrivacyPageTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text(size: .medium) {
                                context.view.title
                            }
                            Text(size: .large, weight: .bold) {
                                "Lorem ipsum"
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text {
                                "Lorem ipsum"
                            }
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
