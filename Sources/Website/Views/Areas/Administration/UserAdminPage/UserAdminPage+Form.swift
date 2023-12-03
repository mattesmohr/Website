import HTMLKit
import HTMLKitComponents

extension UserAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "email") {
                        "Email"
                    }
                    TextField(name: "email")
                        .borderShape(.smallrounded)
                }
                HStack {
                    VStack {
                        FieldLabel(for: "firstName") {
                            "Firstname"
                        }
                        TextField(name: "firstName")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "lastName") {
                            "Lastname"
                        }
                        TextField(name: "lastName")
                            .borderShape(.smallrounded)
                    }
                }
                .contentSpace(.small)
                VStack {
                    FieldLabel(for: "description") {
                        "Description"
                    }
                    TextEditor(name: "description") {
                    }
                    .lineLimit(4)
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "role") {
                        "Role"
                    }
                    SelectField(name: "role") {
                        for role in UserModel.Roles.allCases {
                            RadioSelect(value: role.rawValue) {
                                role.rawValue.capitalized
                            }
                        }
                    }
                    .borderShape(.smallrounded)
                }
                HStack {
                    Button(role: .submit) {
                        "Submit"
                    }
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
                }
            }
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", UserModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        var user: UserModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "email") {
                        "Email"
                    }
                    TextField(name: "email", value: user.email)
                        .borderShape(.smallrounded)
                }
                HStack {
                    VStack {
                        FieldLabel(for: "firstName") {
                            "Firstname"
                        }
                        TextField(name: "firstName", value: user.firstName)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "lastName") {
                            "Lastname"
                        }
                        TextField(name: "lastName", value: user.lastName)
                            .borderShape(.smallrounded)
                    }
                }
                .contentSpace(.small)
                VStack {
                    FieldLabel(for: "description") {
                        "Description"
                    }
                    TextEditor(name: "description") {
                        user.description
                    }
                    .lineLimit(4)
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "role") {
                        "Role"
                    }
                    SelectField(name: "role", selection: user.role) {
                        for role in UserModel.Roles.allCases {
                            RadioSelect(value: role.rawValue) {
                                role.rawValue.capitalized
                            }
                        }
                    }
                    .borderShape(.smallrounded)
                }
                HStack {
                    Button(role: .submit) {
                        "Submit"
                    }
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
                }
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", UserModel.Input.validators)
            }
        }
    }
}
