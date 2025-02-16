import HTMLKit
import HTMLKitComponents

extension SettingAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "title") {
                            LocalizedString(key: "Site title")
                        }
                        TextField(name: "title", prompt: "Title")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "email") {
                            LocalizedString(key: "Email")
                        }
                        TextField(name: "email", prompt: "Email")
                            .borderShape(.smallrounded)
                    }
                }
                VStack {
                    FieldLabel(for: "description") {
                        LocalizedString(key: "Site description")
                    }
                    TextEditor(name: "description", prompt: "Description") {
                    }
                    .borderShape(.smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "hostname") {
                            LocalizedString(key: "Hostname")
                        }
                        TextField(name: "hostname", prompt: "Hostname")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "port") {
                            LocalizedString(key: "Port")
                        }
                        TextField(name: "port", prompt: "465")
                            .borderShape(.smallrounded)
                    }
                    .frame(width: .three)
                    VStack {
                        FieldLabel(for: "security") {
                            LocalizedString(key: "Security")
                        }
                        SelectField(name: "security", prompt: "SSL") {
                            RadioSelect(value: "ssl") {
                                "SSL"
                            }
                            RadioSelect(value: "tls") {
                                "TLS"
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "username") {
                            LocalizedString(key: "Username")
                        }
                        TextField(name: "username", prompt: "Username")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "password") {
                            LocalizedString(key: "Password")
                        }
                        SecureField(name: "password", prompt: "Password")
                            .borderShape(.smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button(role: .submit) {
                    LocalizedString(key: "Submit")
                }
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
                        FieldLabel(for: "title") {
                            LocalizedString(key: "Site title")
                        }
                        TextField(name: "title", prompt: "Title", value: settings.title)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "email") {
                            LocalizedString(key: "Email")
                        }
                        TextField(name: "email", prompt: "Email", value: settings.email)
                            .borderShape(.smallrounded)
                    }
                }
                VStack {
                    FieldLabel(for: "description") {
                        LocalizedString(key: "Site description")
                    }
                    TextEditor(name: "description", prompt: "Description") {
                        settings.description
                    }
                    .borderShape(.smallrounded)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "hostname") {
                            LocalizedString(key: "Hostname")
                        }
                        TextField(name: "hostname", prompt: "Hostname", value: settings.hostname)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "port") {
                            LocalizedString(key: "Port")
                        }
                        TextField(name: "port", prompt: "465", value: settings.port)
                            .borderShape(.smallrounded)
                    }
                    .frame(width: .three)
                    VStack {
                        FieldLabel(for: "security") {
                            LocalizedString(key: "Security")
                        }
                        SelectField(name: "security", prompt: "SSL", selection: settings.security) {
                            RadioSelect(value: "ssl") {
                               "SSL"
                            }
                            RadioSelect(value: "tls") {
                               "TLS"
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "username") {
                            LocalizedString(key: "Username")
                        }
                        TextField(name: "username", prompt: "Username", value: settings.username)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "password") {
                            LocalizedString(key: "Password")
                        }
                        SecureField(name: "password", prompt: "Password", value: settings.password)
                            .borderShape(.smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button(role: .submit) {
                    LocalizedString(key: "Submit")
                }
                .buttonStyle(.primary)
                .borderShape(.smallrounded)
            }
        }
    }
}
