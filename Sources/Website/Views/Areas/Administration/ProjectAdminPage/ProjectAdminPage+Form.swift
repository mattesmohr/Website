import HTMLKit
import HTMLKitComponents

extension ProjectAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        "Title"
                    }
                    TextField(name: "title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "content") {
                        "Content"
                    }
                    TextPad(name: "content") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack {
                    VStack {
                        FieldLabel(for: "category") {
                            "Category"
                        }
                        SelectField(name: "category") {
                            for category in ProjectModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.rawValue.capitalized
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "status") {
                            "Status"
                        }
                        SelectField(name: "status") {
                            for state in ProjectModel.States.allCases {
                                RadioSelect(value: state.rawValue) {
                                    state.rawValue.capitalized
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                }
                .contentSpace(.small)
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
                form.validate("create-form", ProjectModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        var project: ProjectModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        "Title"
                    }
                    TextField(name: "title", value: project.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "content") {
                        "Content"
                    }
                    TextPad(name: "content") {
                        project.content
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack {
                    VStack {
                        FieldLabel(for: "category") {
                            "Category"
                        }
                        SelectField(name: "category", selection: project.category) {
                            for category in ProjectModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.rawValue.capitalized
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "status") {
                            "Status"
                        }
                        SelectField(name: "status", selection: project.status) {
                            for state in ProjectModel.States.allCases {
                                RadioSelect(value: state.rawValue) {
                                    state.rawValue.capitalized
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                }
                .contentSpace(.small)
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
                form.validate("edit-form", ProjectModel.Input.validators)
            }
        }
    }
}
