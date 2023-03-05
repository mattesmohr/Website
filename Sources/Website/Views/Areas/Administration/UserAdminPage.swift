import HTMLKit
import HTMLKitComponents

enum UserAdminPage {
    
    struct IndexView: View {

        var context: IndexContext<UserModel.Output>
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .six) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        }
                        StackColumn(size: .six) {
                            LinkButton(destination: "/area/admin/users/create") {
                                Text {
                                    "Create"
                                }
                            }
                            .buttonStyle(.primary)
                            .borderShape(.smallrounded)
                        }
                    }
                }
                Section {
                    VStack {
                        StackColumn(size: .twelve) {
                            List(direction: .vertical) {
                                for item in context.items {
                                    ListRow {
                                        HStack {
                                            StackColumn(size: .four) {
                                                Text {
                                                    item.email
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Text {
                                                    item.firstName
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Text {
                                                    item.lastName
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Text {
                                                    item.modifiedAt.formatted(date: .numeric, time: .omitted)
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Dropdown {
                                                    List(direction: .vertical) {
                                                        ListRow {
                                                            HTMLKitComponents.Group {
                                                                Symbol(system: "folder")
                                                                Link(destination: "/area/admin/users/edit/\(item.id)") {
                                                                    "Edit"
                                                                }
                                                            }
                                                        }
                                                        Divider()
                                                        ListRow {
                                                            HTMLKitComponents.Group {
                                                                Symbol(system: "folder")
                                                                Link(destination: "/area/admin/users/delete/\(item.id)") {
                                                                    "Delete"
                                                                }
                                                            }
                                                        }
                                                    }
                                                } label: {
                                                    Text {
                                                        "Action"
                                                    }
                                                }

                                            }
                                        }
                                    }
                                }
                            }
                            .listStyle(.grouped)
                        }
                    }
                }
                Aside {
                }
                Footer {
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
        
        var context: CreateContext
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        }
                    }
                }
                Section {
                    VStack {
                        StackColumn(size: .twelve) {
                            Form(method: .post) {
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "email") {
                                            "Email"
                                        }
                                        TextField(name: "email")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "firstName") {
                                            "Firstname"
                                        }
                                        TextField(name: "firstName")
                                    }
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "lastName") {
                                            "Lastname"
                                        }
                                        TextField(name: "lastName")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "description") {
                                            "Description"
                                        }
                                        TextEditor(name: "description") {
                                        }
                                        .lineLimit(4)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        Button(role: .submit) {
                                            "Submit"
                                        }
                                        .buttonStyle(.primary)
                                        .borderShape(.smallrounded)
                                    }
                                }
                            }
                            .id("create-form")
                            .onSubmit(perfom: .valdiate("create-form", [Validator(field: "email", rule: .email), Validator(field: "firstName", rule: .value), Validator(field: "lastName", rule: .value)]))
                        }
                    }
                }
                Aside {
                }
                Footer {
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
    
    struct EditView: View {
        
        var context: EditContext<UserModel.Output>
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        }
                    }
                }
                Section {
                    VStack {
                        StackColumn(size: .twelve) {
                            Form(method: .post) {
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "email") {
                                            "Email"
                                        }
                                        TextField(name: "email", value: context.item.email)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "firstName") {
                                            "Firstname"
                                        }
                                        TextField(name: "firstName", value: context.item.firstName)
                                    }
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "lastName") {
                                            "Lastname"
                                        }
                                        TextField(name: "lastName", value: context.item.lastName)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "description") {
                                            "Description"
                                        }
                                        TextEditor(name: "description") {
                                            context.item.description ?? ""
                                        }
                                        .lineLimit(4)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        Button(role: .submit) {
                                            "Submit"
                                        }
                                        .buttonStyle(.primary)
                                        .borderShape(.smallrounded)
                                    }
                                }
                            }
                            .id("edit-form")
                            .onSubmit(perfom: .valdiate("edit-form", [Validator(field: "email", rule: .email), Validator(field: "firstName", rule: .value), Validator(field: "lastName", rule: .value)]))
                        }
                    }
                }
                Aside {
                }
                Footer {
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}
