import HTMLKit
import HTMLKitComponents

enum ProjectAdminPage {
    
    struct IndexView: View {

        var viewModel: ProjectAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/projects/create") {
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    ProjectList(projects: viewModel.pagination.items)
                    HStack {
                        Navigation {
                            List(direction: .horizontal) {
                                ListRow {
                                    if let previousPage = viewModel.pagination.previousPage {
                                        Link(destination: "?page=\(previousPage)") {
                                            "Vorwärts"
                                        }
                                    } else {
                                        Link(destination: "") {
                                            "Vorwärts"
                                        }
                                        .foregroundColor(.gray)
                                    }
                                }
                                ListRow {
                                    if let nextPage = viewModel.pagination.nextPage {
                                        Link(destination: "?page=\(nextPage)") {
                                            "Nächstes"
                                        }
                                    } else {
                                        Link(destination: "") {
                                            "Nächstes"
                                        }
                                        .foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                        .borderShape(.smallrounded)
                        Text {
                            "Seite \(viewModel.pagination.currentPage) von \(viewModel.pagination.totalPages)"
                        }
                    }
                    .contentSpace(.between)
                }
            }
        }
    }
    
    struct CreateView: View {
        
        var viewModel: ProjectAdminPageModel.CreateView
        
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
            }
        }
    }
    
    struct EditView: View {
     
        var viewModel: ProjectAdminPageModel.EditView
        
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
                                TextField(name: "title", value: viewModel.project.title)
                                    .borderShape(.smallrounded)
                            }
                            VStack {
                                FieldLabel(for: "content") {
                                    "Content"
                                }
                                TextPad(name: "content") {
                                    viewModel.project.content
                                }
                                .borderShape(.smallrounded)
                                .lineLimit(15)
                            }
                            HStack {
                                VStack {
                                    FieldLabel(for: "category") {
                                        "Category"
                                    }
                                    SelectField(name: "category", selection: viewModel.project.category) {
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
                                    SelectField(name: "status", selection: viewModel.project.status) {
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
        }
    }
}
