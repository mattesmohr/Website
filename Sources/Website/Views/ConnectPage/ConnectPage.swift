import HTMLKit
import HTMLKitComponents

enum ConnectPage {
    
    struct IndexView: View {
        
        var viewModel: ConnectPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack {
                        Text {
                            viewModel.title
                        }
                        .font(.subheadline)
                        Text {
                            "Lorem ipsum"
                        }
                        .font(.headline)
                    }
                }
                Section {
                    HStack {
                        Text {
                            "Lorem ipsum..."
                        }
                    }
                    VStack {
                        Form(method: .post) {
                            Header {
                            }
                            Section {
                                HStack {
                                    VStack {
                                        FieldLabel(for: "lastName") {
                                            "Lastname"
                                        }
                                        TextField(name: "lastName")
                                    }
                                    VStack {
                                        FieldLabel(for: "firstName") {
                                            "Firstname"
                                        }
                                        TextField(name: "firstName")
                                    }
                                }
                                .contentSpace(.small)
                                VStack {
                                    FieldLabel(for: "email") {
                                        "Email"
                                    }
                                    TextField(name: "email")
                                }
                                VStack {
                                    FieldLabel(for: "message") {
                                        "Message"
                                    }
                                    TextEditor(name: "message") {
                                    }
                                    .lineLimit(4)
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
                        .tag("contact-form")
                        .onSubmit { form in
                            form.validate("contact-form", ContactModel.Input.validators)
                        }
                    }
                }
            }
        }
    }
}
