import HTMLKit
import HTMLKitComponents

struct ConditionPage {
    
    var views: [View] = [IndexView()]
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self)
        var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .six) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                            .foregroundColor(.white)
                            Text {
                                "Lorem ipsum..."
                            }
                            .fontSize(.large)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        }
                        StackColumn(size: .six) {
                            List(direction: .horizontal) {
                                ListRow {
                                    Link(destination: "#terms") {
                                        "Terms of use"
                                    }
                                }
                                ListRow {
                                    Link(destination: "#privacy") {
                                        "Privacy policy"
                                    }
                                }
                                ListRow {
                                    Link(destination: "#links") {
                                        "Links"
                                    }
                                }
                            }
                        }
                    }
                }
                Section {
                    VStack {
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
                    VStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}
