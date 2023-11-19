import HTMLKit
import HTMLKitComponents

enum LoginAreaPage {
    
    struct LoginView: View {
        
        var viewModel: LoginAreaPageModel.LoginViewModel

        var body: Content {
            AreaPageContainer {
                Main {
                    HStack {
                        VStack {
                            Card {
                                Form(method: .post) {
                                    VStack {
                                        FieldLabel(for: "username") {
                                            "Username"
                                        }
                                        TextField(name: "username")
                                            .borderShape(.smallrounded)
                                    }
                                    VStack {
                                        FieldLabel(for: "password") {
                                            "Password"
                                        }
                                        SecureField(name: "password")
                                            .borderShape(.smallrounded)
                                    }
                                    .margin(insets: .bottom, length: .small)
                                    HStack {
                                        Button(role: .submit) {
                                            "Sign in"
                                        }
                                        .buttonStyle(.primary)
                                        .borderShape(.smallrounded)
                                        .buttonSize(.full)
                                    }
                                    .margin(insets: .bottom, length: .small)
                                }
                                .tag("login-form")
                                .onSubmit { form in
                                    form.validate("login-form", LoginModel.Input.validators)
                                }
                            }
                            .borderShape(.smallrounded)
                            .frame(width: .twelve)
                        }
                        .frame(width: .three)
                        .contentSpace(.around)
                    }
                    .contentSpace(.around)
                }
            }
        }
    }
}

