import HTMLKit
import HTMLKitComponents

enum LoginAreaPage {
    
    struct LoginView: View {

        var context: EmptyContext

        public var body: Content {
            AreaPageContainer {
                HStack {
                    StackColumn(size: .three) {
                        Card {
                            Form(method: .post) {
                                VStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "email") {
                                            "Email"
                                        }
                                        TextField(name: "email")
                                    }
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "password") {
                                            "Password"
                                        }
                                        SecureField(name: "password")
                                    }
                                    StackColumn(size: .twelve) {
                                        Button(role: .submit) {
                                            "Sign in"
                                        }
                                        .buttonStyle(.primary)
                                        .borderShape(.smallrounded)
                                        .buttonSize(.full)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .six) {
                                        LinkButton(destination: "/area/login/register") {
                                            "Sign up"
                                        }
                                        .buttonSize(.full)
                                        .buttonStyle(.secondary)
                                        .borderShape(.smallrounded)
                                    }
                                    StackColumn(size: .six) {
                                        LinkButton(destination: "/area/login/reset") {
                                            "Reset password"
                                        }
                                        .buttonSize(.full)
                                        .buttonStyle(.secondary)
                                        .borderShape(.smallrounded)
                                    }
                                }
                            }
                            .id("login-form")
                            .onSubmit(perfom: .valdiate("login-form", [Validator(field: "email", rule: .email), Validator(field: "password", rule: .value)]))
                        }
                    }
                }
                .contentSpace(.around)
            }
        }
    }
    
    struct RegisterView: View {

        var context: CreateContext

        public var body: Content {
            AreaPageContainer {
                HStack {
                    StackColumn(size: .three) {
                        Card {
                            Form(method: .post) {
                                VStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "email") {
                                            "Email"
                                        }
                                        TextField(name: "email")
                                    }
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "password") {
                                            "Password"
                                        }
                                        SecureField(name: "password")
                                    }
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "confirmation") {
                                            "Confirmation"
                                        }
                                        SecureField(name: "confirmation")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .two) {
                                        LinkButton(destination: "/area/login/login") {
                                            "Back"
                                        }
                                        .buttonSize(.full)
                                        .buttonStyle(.secondary)
                                        .borderShape(.smallrounded)
                                    }
                                    StackColumn(size: .ten) {
                                        Button(role: .submit) {
                                            "Submit"
                                        }
                                        .buttonSize(.full)
                                        .buttonStyle(.primary)
                                        .borderShape(.smallrounded)
                                    }
                                }
                            }
                            .id("register-form")
                            .onSubmit(perfom: .valdiate("register-form", [Validator(field: "email", rule: .email), Validator(field: "password", rule: .value), Validator(field: "confirmation", rule: .value)]))
                        }
                    }
                }
                .contentSpace(.around)
            }
        }
    }
    
    struct ResetView: View {

        var context: CreateContext

        public var body: Content {
            AreaPageContainer {
                HStack {
                    StackColumn(size: .three) {
                        Card {
                            Form(method: .post) {
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "email") {
                                            "Email"
                                        }
                                        TextField(name: "email")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .two) {
                                        LinkButton(destination: "/area/login/login") {
                                            "Back"
                                        }
                                        .buttonSize(.full)
                                        .buttonStyle(.secondary)
                                        .borderShape(.smallrounded)
                                    }
                                    StackColumn(size: .ten) {
                                        Button(role: .submit) {
                                            "Submit"
                                        }
                                        .buttonSize(.full)
                                        .buttonStyle(.primary)
                                        .borderShape(.smallrounded)
                                    }
                                }
                            }
                            .id("reset-form")
                            .onSubmit(perfom: .valdiate("reset-form", [Validator(field: "email", rule: .email)]))
                        }
                    }
                }
                .contentSpace(.around)
            }
        }
    }
}

