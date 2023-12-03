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
                    TextField(name: "title")
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "excerpt") {
                        "Excerpt"
                    }
                    TextEditor(name: "excerpt") {
                    }
                    .lineLimit(2)
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
                            for category in ArticleModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.rawValue
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
                            for state in ArticleModel.States.allCases {
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
                    TextField(name: "title", value: article.title)
                        .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "excerpt") {
                        "Excerpt"
                    }
                    TextEditor(name: "excerpt") {
                        article.excerpt
                    }
                    .lineLimit(2)
                    .borderShape(.smallrounded)
                }
                VStack {
                    FieldLabel(for: "content") {
                        "Content"
                    }
                    TextPad(name: "content") {
                        article.content
                    }
                    .borderShape(.smallrounded)
                    .lineLimit(15)
                }
                HStack {
                    VStack {
                        FieldLabel(for: "category") {
                            "Category"
                        }
                        SelectField(name: "category", selection: article.category) {
                            for category in ArticleModel.Categories.allCases {
                                RadioSelect(value: category.rawValue) {
                                    category.rawValue
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                    }
                    VStack {
                        FieldLabel(for: "status") {
                            "Status"
                        }
                        SelectField(name: "status", selection: article.status) {
                            for state in ArticleModel.States.allCases {
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
                form.validate("edit-form", ArticleModel.Input.validators)
            }
        }
    }
}
