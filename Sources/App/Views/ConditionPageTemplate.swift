import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ConditionPageTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    StackColumn(size: .six) {
                        Text(size: .medium) {
                            context.view.title
                        }
                        Text(size: .large, weight: .bold) {
                            "Lorem ipsum..."
                        }
                    }
                    StackColumn(size: .six) {
                        NavigationContainer(direction: .horizontal) {
                            NavigationItem {
                                NavigationLink(uri: "#terms") {
                                    "Terms of use"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "#privacy") {
                                    "Privacy policy"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "#links") {
                                    "Links"
                                }
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .vertical) {
                        StackColumn(size: .twelve) {
                            Text {
                                "Privacy policy"
                            }
                        }
                        StackColumn(size: .twelve) {
                            Text {
                                "Terms of use"
                            }
                        }
                        StackColumn(size: .twelve) {
                            Text {
                                "Links"
                            }
                        }
                    }
                }
                Footer {
                    Stack(direction: .vertical) {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}
