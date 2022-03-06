import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ArticleAdminTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ArticleModel.Output>.self) var context
        
        public var body: AnyContent {
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
     
        @TemplateValue(CreateContext<ArticleModel>.self)  var context
        
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
                                        FieldLabel(for: "title") {
                                            "Title"
                                        }
                                        TextField(name: "title")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "excerpt") {
                                            "Excerpt"
                                        }
                                        TextEditor(name: "excerpt") {
                                        }
                                        .lineLimit(4)
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
                                    StackColumn(size: .twelve) {
                                        SubmitButton(label: "Submit")
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
        
        @TemplateValue(EditContext<ArticleModel>.self) var context
        
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
                                        FieldLabel(for: "title") {
                                            "Title"
                                        }
                                        TextField(name: "title")
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel(for: "excerpt") {
                                            "Excerpt"
                                        }
                                        TextEditor(name: "excerpt") {
                                        }
                                        .lineLimit(4)
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
                                    StackColumn(size: .twelve) {
                                        SubmitButton(label: "Submit")
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
