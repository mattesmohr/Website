import HTMLKit
import HTMLKitComponents

enum ConnectPage {
    
    struct IndexView: View {
        
        var context: EmptyContext

        public var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .font(.subheadline)
                            Text {
                                "Lorem ipsum"
                            }
                            .font(.headline)
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
                            Form(method: .post) {
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
                                }
                                Footer {
                                    Button(role: .submit) {
                                        "Submit"
                                    }
                                    .buttonStyle(.primary)
                                    .borderShape(.smallrounded)
                                }
                            }
                            .id("contact-form")
                            .onSubmit(perfom: .valdiate("contact-form", [Validator(field: "email", rule: .email), Validator(field: "message", rule: .value)]))
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
