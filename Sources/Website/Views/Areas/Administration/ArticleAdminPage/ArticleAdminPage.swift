import HTMLKit
import HTMLKitComponents

enum ArticleAdminPage {
    
    struct IndexView: View {

        var viewModel: ArticleAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/articles/create") {
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    ArticleList(articles: viewModel.pagination.items)
                    HStack {
                        PagePagination(meta: viewModel.pagination.meta)
                    }
                    .contentSpace(.between)
                }
            }
        }
    }
    
    struct CreateView: View {
     
        var viewModel: ArticleAdminPageModel.CreateView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                    }
                }
                Section {
                    VStack {
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
            }
        }
    }
    
    struct EditView: View {
        
        var viewModel: ArticleAdminPageModel.EditView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                    }
                }
                Section {
                    VStack {
                        Form(method: .post) {
                            VStack {
                                FieldLabel(for: "title") {
                                    "Title"
                                }
                                TextField(name: "title", value: viewModel.article.title)
                                    .borderShape(.smallrounded)
                            }
                            VStack {
                                FieldLabel(for: "excerpt") {
                                    "Excerpt"
                                }
                                TextEditor(name: "excerpt") {
                                    viewModel.article.excerpt ?? ""
                                }
                                .lineLimit(2)
                                .borderShape(.smallrounded)
                            }
                            VStack {
                                FieldLabel(for: "content") {
                                    "Content"
                                }
                                TextPad(name: "content") {
                                    viewModel.article.content
                                }
                                .borderShape(.smallrounded)
                                .lineLimit(15)
                            }
                            HStack {
                                VStack {
                                    FieldLabel(for: "category") {
                                        "Category"
                                    }
                                    SelectField(name: "category", selection: viewModel.article.category) {
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
                                    SelectField(name: "status", selection: viewModel.article.status) {
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
        }
    }
}
