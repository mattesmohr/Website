import HTMLKit
import HTMLKitComponents

extension ArticleAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        "Title"
                    }
                    TextField(name: "title", prompt: "Title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "excerpt") {
                        "Excerpt"
                    }
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel(for: "content") {
                        "Content"
                    }
                    TextPad(name: "content", prompt: "Content") {
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "category") {
                            "Category"
                        }
                        SelectField(name: "category", prompt: "macOS") {
                            for category in ArticleModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.description
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "status") {
                            "Status"
                        }
                        SelectField(name: "status", prompt: "Published") {
                            for state in ArticleModel.States.allCases {
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
                    "Submit"
                }
                .buttonStyle(.primary)
                .borderShape(.smallrounded)
            }
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", ArticleModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        var article: ArticleModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel(for: "title") {
                        "Title"
                    }
                    TextField(name: "title", prompt: "Title", value: article.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "excerpt") {
                        "Excerpt"
                    }
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                        article.excerpt
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel(for: "content") {
                        "Content"
                    }
                    TextPad(name: "content", prompt: "Content") {
                        article.content
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel(for: "category") {
                            "Category"
                        }
                        SelectField(name: "category", prompt: "macOS", selection: article.category) {
                            for category in ArticleModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.description
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "status") {
                            "Status"
                        }
                        SelectField(name: "status", prompt: "Published", selection: article.status) {
                            for state in ArticleModel.States.allCases {
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
                    "Submit"
                }
                .buttonStyle(.primary)
                .borderShape(.smallrounded)
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", ArticleModel.Input.validators)
            }
        }
    }
}
