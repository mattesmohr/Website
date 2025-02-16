import HTMLKit
import HTMLKitComponents

extension LoginAreaPage {
    
    struct LoginForm: View {
        
        @EnvironmentObject(Nonce.self)
        var nonce
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "email") {
                        LocalizedString(key: "Email")
                    }
                    TextField(name: "email")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "password") {
                        LocalizedString(key: "Password")
                    }
                    SecureField(name: "password")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .small)
                HTMLKit.Input()
                    .type(.hidden)
                    .name("nonce")
                    .custom(key: "value", value: nonce.value)
                Button(role: .submit) {
                    LocalizedString(key: "Sign in")
                }
                .buttonStyle(PrimaryButton())
                .controlSize(.full)
                .margin(insets: .bottom, length: .small)
            }
            .tag("login-form")
            .onSubmit { form in
                form.validate("login-form", LoginModel.Input.validators)
            }
        }
    }
    
    struct ResetForm: View {
        
        @EnvironmentObject(Nonce.self)
        var nonce
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "password") {
                        LocalizedString(key: "Password")
                    }
                    SecureField(name: "password", prompt: "Passwort")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "confirmation") {
                        LocalizedString(key: "Confirmation")
                    }
                    SecureField(name: "confirmation", prompt: "Passwort")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .small)
                HTMLKit.Input()
                    .type(.hidden)
                    .name("nonce")
                    .custom(key: "value", value: nonce.value)
                Button(role: .submit) {
                    LocalizedString(key: "Reset")
                }
                .buttonStyle(PrimaryButton())
                .controlSize(.full)
                .margin(insets: .bottom, length: .small)
            }
            .tag("reset-form")
            .onSubmit { form in
                form.validate("reset-form", ResetModel.Input.validators)
            }
        }
    }
}
