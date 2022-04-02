import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum SettingPageTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                            .foregroundColor(.white)
                            Text {
                                "Lorem ipsum"
                            }
                            .fontSize(.large)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                "Lorem ipsum"
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
