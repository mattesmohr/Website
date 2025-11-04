import HTMLKit
import HTMLKitComponents

extension SettingAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Site title", for: "title")
                        TextField(name: "title", prompt: "Title")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Email", for: "email")
                        TextField(name: "email", prompt: "Email")
                            .borderShape(.smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Site description", for: "description")
                    TextEditor(name: "description", prompt: "Description") {
                    }
                    .borderShape(.smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Hostname", for: "hostname")
                        TextField(name: "hostname", prompt: "Hostname")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Port", for: "port")
                        TextField(name: "port", prompt: String("465"))
                            .borderShape(.smallrounded)
                    }
                    .frame(width: .three)
                    VStack {
                        FieldLabel("Security", for: "security")
                        SelectField(name: "security", prompt: String("SSL")) {
                            for encryption in SettingModel.MailEncryption.allCases {
                                RadioSelect(encryption.localizedDescription, value: encryption.rawValue)
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Username", for: "username")
                        TextField(name: "username", prompt: "Username")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Password", for: "password")
                        SecureField(name: "password", prompt: "Password")
                            .borderShape(.smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
            }
        }
    }
    
    struct EditForm: View {
        
        let settings: SettingModel.Output
        
        var body: Content {
            Form(method: .post) {
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Site title", for: "title")
                        TextField(name: "title", prompt: "Title", value: settings.title)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Email", for: "email")
                        TextField(name: "email", prompt: "Email", value: settings.email)
                            .borderShape(.smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Site description", for: "description")
                    TextEditor(name: "description", prompt: "Description") {
                        settings.description
                    }
                    .borderShape(.smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Hostname", for: "hostname")
                        TextField(name: "hostname", prompt: "Hostname", value: settings.hostname)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Port", for: "port")
                        TextField(name: "port", prompt: String("465"), value: settings.port)
                            .borderShape(.smallrounded)
                    }
                    .frame(width: .three)
                    VStack {
                        FieldLabel("Security", for: "security")
                        SelectField(name: "security", prompt: "SSL", selection: settings.security.rawValue) {
                            for encryption in SettingModel.MailEncryption.allCases {
                                RadioSelect(encryption.localizedDescription, value: encryption.rawValue)
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Username", for: "username")
                        TextField(name: "username", prompt: "Username", value: settings.username)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Password", for: "password")
                        SecureField(name: "password", prompt: "Password", value: settings.password)
                            .borderShape(.smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .borderShape(.smallrounded)
            }
        }
    }
}
