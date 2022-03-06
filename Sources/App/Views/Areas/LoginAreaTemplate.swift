import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum LoginAreaTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context

        public var body: AnyContent {
            AreaPageContainer {
                Section {
                    HStack {
                        StackColumn(size: .five) {
                            FormContainer {
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
                                        FieldLabel(for: "password") {
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
            }
        }
    }
    
    struct RegisterView: View {

        @TemplateValue(CreateContext<RegisterModel>.self) var context

        public var body: AnyContent {
            AreaPageContainer {
                Section {
                    HStack {
                        StackColumn(size: .five) {
                            FormContainer {
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
                                        FieldLabel(for: "password") {
                                            "Password"
                                        }
                                        SecureField(name: "password")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "confirmation") {
                                            "Confirmation"
                                        }
                                        SecureField(name: "confirmation")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "code") {
                                            "Code"
                                        }
                                        TextField(name: "code")
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
            }
        }
    }
    
    struct ResetView: View {

        @TemplateValue(CreateContext<ResetModel>.self) var context

        public var body: AnyContent {
            AreaPageContainer {
                Section {
                    HStack {
                        StackColumn(size: .five) {
                            FormContainer {
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
                                        SubmitButton(label: "Submit")
                                    }
                                }
                            }
                        }
                    }
                    .contentSpace(.around)
                }
            }
        }
    }
}

