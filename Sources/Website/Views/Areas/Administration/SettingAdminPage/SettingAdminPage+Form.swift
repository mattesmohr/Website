import HTMLKit
import HTMLKitComponents

extension SettingAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Site Title", for: "title")
                        TextField(name: "title", prompt: "Title")
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Email", for: "email")
                        TextField(name: "email", prompt: "Email")
                            .border(.system, shape: .smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Site Description", for: "description")
                    TextEditor(name: "description", prompt: "Description") {
                    }
                    .border(.system, shape: .smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Hostname", for: "hostname")
                        TextField(name: "hostname", prompt: "Hostname")
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Port", for: "port")
                        TextField(name: "port", prompt: String("465"))
                            .border(.system, shape: .smallrounded)
                    }
                    .frame(width: .three)
                    VStack {
                        FieldLabel("Security", for: "security")
                        SelectField(name: "security", prompt: String("SSL")) {
                            for encryption in SettingModel.MailEncryption.allCases {
                                RadioSelect(encryption.localizedDescription, value: encryption.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Username", for: "username")
                        TextField(name: "username", prompt: "Username")
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Password", for: "password")
                        SecureField(name: "password", prompt: "Password")
                            .border(.system, shape: .smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
        }
    }
    
    struct EditForm: View {
        
        let settings: SettingModel.Output
        
        var body: Content {
            Form(method: .post) {
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Site Title", for: "title")
                        TextField(name: "title", prompt: "Title", value: settings.title)
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Email", for: "email")
                        TextField(name: "email", prompt: "Email", value: settings.email)
                            .border(.system, shape: .smallrounded)
                    }
                }
                VStack {
                    FieldLabel("Site Description", for: "description")
                    TextEditor(name: "description", prompt: "Description") {
                        settings.description
                    }
                    .border(.system, shape: .smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Hostname", for: "hostname")
                        TextField(name: "hostname", prompt: "Hostname", value: settings.hostname)
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Port", for: "port")
                        TextField(name: "port", prompt: String("465"), value: settings.port)
                            .border(.system, shape: .smallrounded)
                    }
                    .frame(width: .three)
                    VStack {
                        FieldLabel("Security", for: "security")
                        SelectField(name: "security", prompt: "SSL", selection: settings.security.rawValue) {
                            for encryption in SettingModel.MailEncryption.allCases {
                                RadioSelect(encryption.localizedDescription, value: encryption.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Username", for: "username")
                        TextField(name: "username", prompt: "Username", value: settings.username)
                            .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Password", for: "password")
                        SecureField(name: "password", prompt: "Password", value: settings.password)
                            .border(.system, shape: .smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
        }
    }
}
