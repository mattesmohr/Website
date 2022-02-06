import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum LoginAreaTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            AreaPageContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .five) {
                            FormContainer {
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
                                            "Password"
                                        }
                                        SecureField(name: "password")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        SubmitButton(label: "Submit")
                                    }
                                }
                            }   
                        }
                    }
                    .contentSpace(.around)
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
    
    struct RegisterView: View {

        @TemplateValue(CreateContext<RegisterModel>.self) var context

        public var body: AnyContent {
            AreaPageContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .five) {
                            FormContainer {
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
                                            "Password"
                                        }
                                        SecureField(name: "password")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Confirmation"
                                        }
                                        SecureField(name: "confirmation")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Code"
                                        }
                                        TextField(name: "code") {
                                        }
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        SubmitButton(label: "Submit")
                                    }
                                }
                            }
                        }
                    }
                    .contentSpace(.around)
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
    
    struct ResetView: View {

        @TemplateValue(CreateContext<ResetModel>.self) var context

        public var body: AnyContent {
            AreaPageContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .five) {
                            FormContainer {
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
                                        SubmitButton(label: "Submit")
                                    }
                                }
                            }
                        }
                    }
                    .contentSpace(.around)
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

