import HTMLKit
import HTMLKitComponents

extension UserAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Email", for: "email")
                    TextField(name: "email", prompt: "john.doe@provider.com")
                        .borderShape(.smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Firstname", for: "firstName")
                        TextField(name: "firstName", prompt: "John")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Lastname", for: "lastName")
                        TextField(name: "lastName", prompt: "Doe")
                            .borderShape(.smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Biography", for: "biography")
                    TextEditor(name: "biography", prompt: "Biography") {
                    }
                    .lineLimit(4)
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Role", for: "role")
                    SelectField(name: "role", prompt: "Administrator") {
                        for role in UserModel.UserRole.allCases {
                            RadioSelect(role.localizedDescription, value: role.rawValue)
                        }
                    }
                    .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
            }
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", UserModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        let user: UserModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Email", for: "email")
                    TextField(name: "email", prompt: "john.doe@provider.com", value: user.email)
                        .borderShape(.smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Firstname", for: "firstName")
                        TextField(name: "firstName", prompt: "John", value: user.firstName)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Lastname", for: "lastName")
                        TextField(name: "lastName", prompt: "Doe", value: user.lastName)
                            .borderShape(.smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Biography", for: "biography")
                    TextEditor(name: "biography", prompt: "Biography") {
                        user.biography
                    }
                    .lineLimit(4)
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Role", for: "role")
                    SelectField(name: "role", prompt: "Administrator", selection: user.role.rawValue) {
                        for role in UserModel.UserRole.allCases {
                            RadioSelect(role.localizedDescription, value: role.rawValue)
                        }
                    }
                    .borderShape(.smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", UserModel.Input.validators)
            }
        }
    }
}
