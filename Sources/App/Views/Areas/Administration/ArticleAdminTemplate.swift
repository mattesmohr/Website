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
                        }
                    }
                }
                Section {
                    HStack {
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
     
        @TemplateValue(CreateContext<ArticleModel>.self)  var context
        
        var body: AnyContent {
            AreaViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            FormContainer {
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Title"
                                        }
                                        TextField(name: "title") {
                                        }
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Excerpt"
                                        }
                                        TextField(name: "excerpt") {
                                        }
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Content"
                                        }
                                        TextField(name: "content") {
                                        }
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
        
        @TemplateValue(EditContext<ArticleModel>.self) var context
        
        var body: AnyContent {
            AreaViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                        }
                    }
                }
                Section {
                    HStack {
                        StackColumn(size: .twelve) {
                            FormContainer {
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Title"
                                        }
                                        TextField(name: "title") {
                                        }
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Excerpt"
                                        }
                                        TextField(name: "excerpt") {
                                        }
                                    }
                                }
                                HStack {
                                    StackColumn(size: .twelve) {
                                        FieldLabel {
                                            "Content"
                                        }
                                        TextField(name: "content") {
                                        }
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
