import HTMLKit
import HTMLKitComponents

extension ProjectAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Excerpt", for: "excerpt")
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel("Content", for: "content")
                    TextPad(name: "content", prompt: "Content") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Repository", for: "repository")
                        TextField(name: "repository", prompt: "Repository")
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Documentation", for: "documentation")
                        TextField(name: "documentation", prompt: "Documentation")
                            .borderShape(.smallrounded)
                    }
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Category", for: "category")
                        SelectField(name: "category", prompt: "macOS") {
                            for category in ProjectModel.ProjectCategory.allCases {
                                RadioSelect(category.localizedDescription, value: category.rawValue)
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Status", for: "status")
                        SelectField(name: "status", prompt: "Published") {
                            for state in ProjectModel.ProjectStatus.allCases {
                                RadioSelect(state.localizedDescription, value: state.rawValue)
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
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
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title", value: project.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel("Excerpt", for: "excerpt")
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                        project.excerpt
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel("Content", for: "content")
                    TextPad(name: "content", prompt: "Content") {
                        project.content
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Repository", for: "repository")
                        TextField(name: "repository", prompt: "Repository", value: project.repository)
                            .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Documentation", for: "documentation")
                        TextField(name: "documentation", prompt: "Documentation", value: project.documentation)
                            .borderShape(.smallrounded)
                    }
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Category", for: "category")
                        SelectField(name: "category", prompt: "macOS", selection: project.category.rawValue) {
                            for category in ProjectModel.ProjectCategory.allCases {
                                RadioSelect(category.localizedDescription, value: category.rawValue)
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel("Status", for: "status")
                        SelectField(name: "status", prompt: "Published", selection: project.status.rawValue) {
                            for state in ProjectModel.ProjectStatus.allCases {
                                RadioSelect(state.localizedDescription, value: state.rawValue)
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
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
