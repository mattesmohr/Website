import HTMLKit
import HTMLKitComponents

extension ArticleAdminPage {
    
    struct CreateForm: View {
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title")
                        .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Excerpt", for: "excerpt")
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                    }
                    .border(.system, shape: .smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel("Content", for: "content")
                    TextPad(name: "content", prompt: "Content") {
                    }
                    .border(.system, shape: .smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Comments", for: "comment")
                        SelectField(name: "comment", prompt: "Open") {
                            for comment in ArticleModel.CommentStatus.allCases {
                                RadioSelect(comment.localizedDescription, value: comment.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Category", for: "category")
                        SelectField(name: "category", prompt: "macOS") {
                            for category in ArticleModel.ArticleCategory.allCases {
                                RadioSelect(category.localizedDescription, value: category.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Status", for: "status")
                        SelectField(name: "status", prompt: "Published") {
                            for state in ArticleModel.ArticleStatus.allCases {
                                RadioSelect(state.localizedDescription, value: state.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
            .tag("create-form")
            .onSubmit { form in
                form.validate("create-form", ArticleModel.Input.validators)
            }
        }
    }
    
    struct EditForm: View {
        
        let article: ArticleModel.Output
        
        var body: Content {
            Form(method: .post) {
                VStack {
                    FieldLabel("Title", for: "title")
                    TextField(name: "title", prompt: "Title", value: article.title)
                        .border(.system, shape: .smallrounded)
                }
                VStack {
                    FieldLabel("Excerpt", for: "excerpt")
                    TextEditor(name: "excerpt", prompt: "Excerpt") {
                        article.excerpt
                    }
                    .border(.system, shape: .smallrounded)
                    .lineLimit(5)
                }
                VStack {
                    FieldLabel("Content", for: "content")
                    TextPad(name: "content", prompt: "Content") {
                        article.content
                    }
                    .border(.system, shape: .smallrounded)
                    .lineLimit(15)
                }
                HStack(spacing: .small) {
                    VStack {
                        FieldLabel("Comments", for: "comment")
                        SelectField(name: "comment", prompt: "Open", selection: article.comment.rawValue) {
                            for comment in ArticleModel.CommentStatus.allCases {
                                RadioSelect(comment.localizedDescription, value: comment.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Category", for: "category")
                        SelectField(name: "category", prompt: "macOS", selection: article.category.rawValue) {
                            for category in ArticleModel.ArticleCategory.allCases {
                                RadioSelect(category.localizedDescription, value: category.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                    VStack {
                        FieldLabel("Status", for: "status")
                        SelectField(name: "status", prompt: "Published", selection: article.status.rawValue) {
                            for state in ArticleModel.ArticleStatus.allCases {
                                RadioSelect(state.localizedDescription, value: state.rawValue)
                            }
                        }
                        .border(.system, shape: .smallrounded)
                    }
                }
                .margin(insets: .bottom, length: .large)
                Button("Submit", role: .submit)
                    .buttonStyle(.primary)
                    .border(.system, shape: .smallrounded)
            }
            .tag("edit-form")
            .onSubmit { form in
                form.validate("edit-form", ArticleModel.Input.validators)
            }
        }
    }
}
