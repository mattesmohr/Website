import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum CompanyPageTemplate {
    
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
