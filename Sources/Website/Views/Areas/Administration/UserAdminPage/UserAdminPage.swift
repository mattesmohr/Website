import HTMLKit
import HTMLKitComponents

enum UserAdminPage {
    
    struct IndexView: View {

        var viewModel: UserAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                        LinkButton(destination: "/area/admin/users/create") {
                            Text {
                                "Create"
                            }
                        }
                        .buttonStyle(.primary)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    UserList(users: viewModel.pagination.items)
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
                        .navigationStyle(.pagination)
                        .borderShape(.smallrounded)
                        Text {
                            "Seite \(viewModel.pagination.currentPage) von \(viewModel.pagination.totalPages)"
                        }
                    }
                    .contentSpace(.between)
                }
                Aside {
                }
                Footer {
                    HStack {
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        var viewModel: UserAdminPageModel.CreateView
        
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
                                FieldLabel(for: "email") {
                                    "Email"
                                }
                                TextField(name: "email")
                                    .borderShape(.smallrounded)
                            }
                            HStack {
                                VStack {
                                    FieldLabel(for: "firstName") {
                                        "Firstname"
                                    }
                                    TextField(name: "firstName")
                                        .borderShape(.smallrounded)
                                }
                                VStack {
                                    FieldLabel(for: "lastName") {
                                        "Lastname"
                                    }
                                    TextField(name: "lastName")
                                        .borderShape(.smallrounded)
                                }
                            }
                            .contentSpace(.small)
                            VStack {
                                FieldLabel(for: "description") {
                                    "Description"
                                }
                                TextEditor(name: "description") {
                                }
                                .lineLimit(4)
                                .borderShape(.smallrounded)
                            }
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
                            form.validate("create-form", UserModel.Input.validators)
                        }
                    }
                }
            }
        }
    }
    
    struct EditView: View {
        
        var viewModel: UserAdminPageModel.EditView
        
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
                                FieldLabel(for: "email") {
                                    "Email"
                                }
                                TextField(name: "email", value: viewModel.user.email)
                                    .borderShape(.smallrounded)
                            }
                            HStack {
                                VStack {
                                    FieldLabel(for: "firstName") {
                                        "Firstname"
                                    }
                                    TextField(name: "firstName", value: viewModel.user.firstName)
                                        .borderShape(.smallrounded)
                                }
                                VStack {
                                    FieldLabel(for: "lastName") {
                                        "Lastname"
                                    }
                                    TextField(name: "lastName", value: viewModel.user.lastName)
                                        .borderShape(.smallrounded)
                                }
                            }
                            .contentSpace(.small)
                            VStack {
                                FieldLabel(for: "description") {
                                    "Description"
                                }
                                TextEditor(name: "description") {
                                    viewModel.user.description ?? ""
                                }
                                .lineLimit(4)
                                .borderShape(.smallrounded)
                            }
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
                            form.validate("edit-form", UserModel.Input.validators)
                        }
                    }
                }
            }
        }
    }
}
