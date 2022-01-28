import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ConnectPageTemplate {
    
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
                                "Lorem ipsum..."
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text {
                                "Lorem ipsum..."
                            }
                        }
                    }
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            FormContainer {
                                FormHeader {
                                }
                                FormBody {
                                    FormRow {
                                        // Lastname
                                        FormColumn(size: .six) {
                                            TextInput(title: "Lastname", name: "lastname", value: .constant(nil), placeholder: .constant(nil))
                                        }
                                        // Firstname
                                        FormColumn(size: .six) {
                                            TextInput(title: "Firstname", name: "firstname", value: .constant(nil), placeholder: .constant(nil))
                                        }
                                    }
                                    Division {
                                        // Email
                                        StackColumn(size: .twelve) {
                                            TextInput(title: "Email", name: "email", value: .constant(nil), placeholder: .constant(nil))
                                        }
                                    }
                                    FormRow {
                                        // Message
                                        FormColumn(size: .twelve) {
                                            TextareaInput(title: "Message", name: "message", placeholder: .constant(nil)) {
                                            }
                                        }
                                    }
                                }
                                FormFooter {
                                    SubmitButton(title: "Submit")
                                }
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
