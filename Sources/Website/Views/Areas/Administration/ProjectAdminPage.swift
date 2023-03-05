import HTMLKit
import HTMLKitComponents

enum ProjectAdminPage {
    
    struct IndexView: View {

        var context: IndexContext<ProjectModel.Output>
        
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
                            LinkButton(destination: "/area/admin/projects/create") {
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
                                                    item.title
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Text {
                                                    item.category
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Text {
                                                    item.status
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
                                                                Link(destination: "/area/admin/projects/edit/\(item.id)") {
                                                                    "Edit"
                                                                }
                                                            }
                                                        }
                                                        Divider()
                                                        ListRow {
                                                            HTMLKitComponents.Group {
                                                                Symbol(system: "folder")
                                                                Link(destination: "/area/admin/projects/delete/\(item.id)") {
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
                                        FieldLabel(for: "title") {
                                            "Title"
                                        }
                                        TextField(name: "title")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "content") {
                                            "Content"
                                        }
                                        TextPad(name: "content") {
                                        }
                                    }
                                }
                                HStack {
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "category") {
                                            "Category"
                                        }
                                        SelectField(name: "category") {
                                            for category in ProjectModel.Categories.allCases {
                                                Option {
                                                    category.rawValue
                                                }
                                            }
                                            
                                        }
                                    }
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "status") {
                                            "Status"
                                        }
                                        SelectField(name: "status") {
                                            for state in ProjectModel.States.allCases {
                                                Option {
                                                    state.rawValue
                                                }
                                            }
                                            
                                        }
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
                            .onSubmit(perfom: .valdiate("create-form", [Validator(field: "title", rule: .value), Validator(field: "content", rule: .value)]))
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
     
        var context: EditContext<ProjectModel.Output>
        
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
                                        FieldLabel(for: "title") {
                                            "Title"
                                        }
                                        TextField(name: "title", value: context.item.title)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "content") {
                                            "Content"
                                        }
                                        TextPad(name: "content") {
                                            context.item.content
                                        }
                                    }
                                }
                                HStack {
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "category") {
                                            "Category"
                                        }
                                        SelectField(name: "category") {
                                            for category in ProjectModel.Categories.allCases {
                                                Option {
                                                    category.rawValue
                                                }
                                            }
                                        }
                                    }
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "status") {
                                            "Status"
                                        }
                                        SelectField(name: "status") {
                                            for state in ProjectModel.States.allCases {
                                                Option {
                                                    state.rawValue
                                                }
                                            }
                                        }
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
                            .onSubmit(perfom: .valdiate("edit-form", [Validator(field: "title", rule: .value), Validator(field: "content", rule: .value)]))
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
