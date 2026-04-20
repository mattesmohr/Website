import HTMLKit
import HTMLKitComponents

extension LoginAreaPage {
    
    struct LoginForm: View {
        
        @EnvironmentObject(Nonce.self)
        var nonce
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Email", for: "email")
                    TextField(name: "email")
                        .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Password", for: "password")
                    SecureField(name: "password")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .small)
                HTMLKit.Input()
                    .type(.hidden)
                    .name("nonce")
                    .custom(key: "value", value: nonce.value)
                Button("Sign in", role: .submit)
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
                    FieldLabel("Password", for: "password")
                    SecureField(name: "password", prompt: "Password")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Confirmation", for: "confirmation")
                    SecureField(name: "confirmation", prompt: "Password")
                        .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .small)
                HTMLKit.Input()
                    .type(.hidden)
                    .name("nonce")
                    .custom(key: "value", value: nonce.value)
                Button("Reset", role: .submit)
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
