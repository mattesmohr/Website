import HTMLKit
import HTMLKitComponents

struct ProjectAdminPage {
    
    var views: [View] = [IndexView(), CreateView(), EditView()]
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ProjectModel.Output>.self)
        var context
        
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
                            ActionButton(destination: "/area/admin/projects/create") {
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
                                                "Title"
                                            }
                                        }
                                        StackColumn(size: .two) {
                                            Text {
                                                "Category"
                                            }
                                        }
                                        StackColumn(size: .two) {
                                            Text {
                                                "Status"
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
                                                    item.modifiedAt.style(date: .short, time: .none)
                                                }
                                            }
                                            StackColumn(size: .two) {
                                                Link(destination: "/area/admin/projects/edit") {
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
                                        TextEditor(name: "content") {
                                        }
                                        .lineLimit(8)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "category") {
                                            "Category"
                                        }
                                        SelectField(name: "category") {
                                            ForEach(in: ProjectModel.Categories.allCases) { category in
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
                                            ForEach(in: ProjectModel.States.allCases) { state in
                                                Option {
                                                    state.rawValue
                                                }
                                            }
                                            
                                        }
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
     
        @TemplateValue(EditContext<ProjectModel.Output>.self) var context
        
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
                                        TextEditor(name: "content") {
                                        }
                                        .lineLimit(8)
                                    }
                                }
                                HStack {
                                    StackColumn(size: .six) {
                                        FieldLabel(for: "category") {
                                            "Category"
                                        }
                                        SelectField(name: "category") {
                                            ForEach(in: ProjectModel.Categories.allCases) { category in
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
                                            ForEach(in: ProjectModel.States.allCases) { state in
                                                Option {
                                                    state.rawValue
                                                }
                                            }
                                        }
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