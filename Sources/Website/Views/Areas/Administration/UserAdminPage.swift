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
                                                    item.modifiedAt.formatted(date: .complete, time: .complete)
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Link(destination: "/area/admin/users/edit/\(item.id)") {
                                                    "Edit"
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
                                        TextEditor(name: "desription") {
                                            
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
                        }
                    }
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
                                        TextEditor(name: "desription") {
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
                        }
                    }
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