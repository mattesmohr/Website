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
                                            FieldLabel(for: "lastname") {
                                                "Lastname"
                                            }
                                            TextField(name: "lastname")
                                        }
                                        StackColumn(size: .six) {
                                            FieldLabel(for: "firstname") {
                                                "Firstname"
                                            }
                                            TextField(name: "firstname")
                                        }
                                    }
                                    HStack {
                                        StackColumn(size: .twelve) {
                                            FieldLabel(for: "email") {
                                                "Email"
                                            }
                                            TextField(name: "email")
                                        }
                                    }
                                    HStack {
                                        StackColumn(size: .twelve) {
                                            FieldLabel(for: "message") {
                                                "Message"
                                            }
                                            TextEditor(name: "message") {
                                            }
                                            .lineLimit(4)
                                        }
                                    }
                                    HStack {
                                        StackColumn(size: .six) {
                                            CheckField(name: "name", value: "name")
                                            FieldLabel(for: "name") {
                                                "name"
                                            }
                                        }
                                        StackColumn(size: .six) {
                                            CheckField(name: "name", value: "name")
                                            FieldLabel(for: "name") {
                                                "name"
                                            }
                                        }
                                    }
                                }
                                Footer {
                                    SubmitButton {
                                        "Submit"
                                    }
                                    .buttonStyle(.primary)
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
