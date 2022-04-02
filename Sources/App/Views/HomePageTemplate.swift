import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum HomePageTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve, alignment: .right) {
                            Text {
                                "Welcome"
                            }
                            .fontSize(.medium)
                            .foregroundColor(.secondary)
                            Text {
                                "Bonjour, ça va?"
                            }
                            .fontSize(.large)
                            .foregroundColor(.primary)
                            .bold()
                            Text {
                                "Moi, c'est Mattes. Et toi?"
                            }
                            .fontSize(.large)
                            .foregroundColor(.secondary)
                            .bold()
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            Collection {
                                CollectionItem {
                                    VStack {
                                        StackColumn(size: .twelve) {
                                        }
                                        StackColumn(size: .twelve) {
                                            Text {
                                                "Lorem ipsum"
                                            }
                                            .font(.headline)
                                            .foregroundColor(.black)
                                            Text {
                                                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. "
                                            }
                                            .font(.body)
                                            .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                            .collectionStyle(.grid)
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
