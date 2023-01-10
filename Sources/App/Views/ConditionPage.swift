import HTMLKit
import HTMLKitComponents

enum ConditionPage {
    
    struct IndexView: View {

        var context: EmptyContext

        public var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .six) {
                            Text {
                                context.view.title
                            }
                            .font(.subheadline)
                            Text {
                                "Lorem ipsum"
                            }
                            .font(.headline)
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
