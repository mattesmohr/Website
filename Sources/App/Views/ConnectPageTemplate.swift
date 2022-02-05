import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ConnectPageTemplate {
    
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
                            Text {
                                "Lorem ipsum..."
                            }
                            .fontSize(.large)
                            .fontWeight(.bold)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                "Lorem ipsum..."
                            }
                        }
                    }
                    VStack {
                        StackColumn(size: .twelve) {
                            FormContainer {
                                Header {
                                }
                                Section {
                                    HStack {
                                        StackColumn(size: .six) {
                                            FieldLabel {
                                                "Lastname"
                                            }
                                            TextField(name: "lastname") {
                                            }
                                        }
                                        StackColumn(size: .six) {
                                            FieldLabel {
                                                "Firstname"
                                            }
                                            TextField(name: "firstname") {
                                            }
                                        }
                                    }
                                    HStack {
                                        StackColumn(size: .twelve) {
                                            FieldLabel {
                                                "Email"
                                            }
                                            TextField(name: "email") {
                                            }
                                        }
                                    }
                                    HStack {
                                        StackColumn(size: .twelve) {
                                            FieldLabel {
                                                "Message"
                                            }
                                            TextField(name: "message") {
                                            }
                                        }
                                    }
                                }
                                Footer {
                                    SubmitButton(label: "Submit")
                                }
                            }
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
