import HTMLKit
import HTMLKitComponents

enum LoginAreaPage {
    
    struct LoginView: View {
        
        var viewModel: LoginAreaPageModel.LoginViewModel

        var body: Content {
            AreaPageContainer {
                Main {
                    HStack(spacing: .around) {
                        VStack(spacing: .around) {
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
                                        .buttonStyle(PrimaryButton())
                                        .controlSize(.full)
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
                    }
                }
            }
        }
    }
}

