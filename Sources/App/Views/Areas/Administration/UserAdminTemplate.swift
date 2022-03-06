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
        
        @TemplateValue(CreateContext<UserModel>.self) var context
        
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
                            FormContainer {
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
                                        SubmitButton(label: "Submit")
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
                            FormContainer {
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
                                        SubmitButton(label: "Submit")
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
