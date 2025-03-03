import HTMLKit
import HTMLKitComponents

extension ProjectAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        LocalizedString(key: "Title")
                    }
                    TextField(name: "title", prompt: "Title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "excerpt") {
                        LocalizedString(key: "Excerpt")
                    }
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel(for: "content") {
                        LocalizedString(key: "Content")
                    }
                    TextPad(name: "content", prompt: "Content") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "repository") {
                            LocalizedString(key: "Repository")
                        }
                        TextField(name: "repository", prompt: "Repository")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "documentation") {
                            LocalizedString(key: "Documentation")
                        }
                        TextField(name: "documentation", prompt: "Documentation")
                            .borderShape(.smallrounded)
                    }
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "category") {
                            LocalizedString(key: "Category")
                        }
                        SelectField(name: "category", prompt: "macOS") {
                            for category in ProjectModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.description
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "status") {
                            LocalizedString(key: "Status")
                        }
                        SelectField(name: "status", prompt: "Published") {
                            for state in ProjectModel.States.allCases {
                                RadioSelect(value: state.rawValue) {
                                    state.description
                                }
                            }
                        }
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
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", ProjectModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        let project: ProjectModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        LocalizedString(key: "Title")
                    }
                    TextField(name: "title", prompt: "Title", value: project.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "excerpt") {
                        LocalizedString(key: "Excerpt")
                    }
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                        project.excerpt
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel(for: "content") {
                        LocalizedString(key: "Content")
                    }
                    TextPad(name: "content", prompt: "Content") {
                        project.content
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "repository") {
                            LocalizedString(key: "Repository")
                        }
                        TextField(name: "repository", prompt: "Repository", value: project.repository)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "documentation") {
                            LocalizedString(key: "Documentation")
                        }
                        TextField(name: "documentation", prompt: "Documentation", value: project.documentation)
                            .borderShape(.smallrounded)
                    }
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "category") {
                            LocalizedString(key: "Category")
                        }
                        SelectField(name: "category", prompt: "macOS", selection: project.category) {
                            for category in ProjectModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.description
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "status") {
                            LocalizedString(key: "Status")
                        }
                        SelectField(name: "status", prompt: "Published", selection: project.status) {
                            for state in ProjectModel.States.allCases {
                                RadioSelect(value: state.rawValue) {
                                    state.description
                                }
                            }
                        }
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
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", ProjectModel.Input.validators)
            }
        }
    }
}
