import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum UserAdminTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<UserModel.Output>.self) var context
        
        var body: AnyContent {
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
                            ActionButton(destination: "/area/admin/users/create") {
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
                                ListRow {
                                    HStack {
                                        StackColumn(size: .four) {
                                            Text {
                                                "Email"
                                            }
                                        }
                                        StackColumn(size: .two) {
                                            Text {
                                                "Firstname"
                                            }
                                        }
                                        StackColumn(size: .two) {
                                            Text {
                                                "Lastname"
                                            }
                                        }
                                        StackColumn(size: .two) {
                                            Text {
                                                "Date"
                                            }
                                        }
                                        StackColumn(size: .two) {
                                            Text {
                                                "Action"
                                            }
                                        }
                                    }
                                }
                                ForEach(in: context.items) { item in
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
                                                    item.modifiedAt.style(date: .short, time: .none)
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Link(destination: "/area/admin/users/edit") {
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
        
        @TemplateValue(CreateContext.self) var context
        
        var body: AnyContent {
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
                            HTMLKitComponents.Form {
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
                                        FieldLabel(for: "firstname") {
                                            "Firstname"
                                        }
                                        TextField(name: "firstname")
                                    }
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "lastname") {
                                            "Lastname"
                                        }
                                        TextField(name: "lastname")
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
                                        SubmitButton {
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
        
        @TemplateValue(EditContext<UserModel>.self) var context
        
        var body: AnyContent {
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
                            HTMLKitComponents.Form {
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
                                        FieldLabel(for: "firstname") {
                                            "Firstname"
                                        }
                                        TextField(name: "firstname")
                                    }
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "lastname") {
                                            "Lastname"
                                        }
                                        TextField(name: "lastname")
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
                                        SubmitButton {
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
