import HTMLKit
import HTMLKitComponents

extension UserAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Email", for: "email")
                    TextField(name: "email", prompt: "john.doe@provider.com")
                        .border(.system, shape: .smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Firstname", for: "firstName")
                        TextField(name: "firstName", prompt: "John")
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Lastname", for: "lastName")
                        TextField(name: "lastName", prompt: "Doe")
                            .border(.system, shape: .smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Biography", for: "biography")
                    TextEditor(name: "biography", prompt: "Biography") {
                    }
                    .lineLimit(4)
                    .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Role", for: "role")
                    SelectField(name: "role", prompt: "Administrator") {
                        for role in UserModel.UserRole.allCases {
                            RadioSelect(role.localizedDescription, value: role.rawValue)
                        }
                    }
                    .border(.system, shape: .smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
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
                        .border(.system, shape: .smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Firstname", for: "firstName")
                        TextField(name: "firstName", prompt: "John", value: user.firstName)
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Lastname", for: "lastName")
                        TextField(name: "lastName", prompt: "Doe", value: user.lastName)
                            .border(.system, shape: .smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Biography", for: "biography")
                    TextEditor(name: "biography", prompt: "Biography") {
                        user.biography
                    }
                    .lineLimit(4)
                    .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Role", for: "role")
                    SelectField(name: "role", prompt: "Administrator", selection: user.role.rawValue) {
                        for role in UserModel.UserRole.allCases {
                            RadioSelect(role.localizedDescription, value: role.rawValue)
                        }
                    }
                    .border(.system, shape: .smallrounded)
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", UserModel.Input.validators)
            }
        }
    }
}
