import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ArticleAdminTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ArticleModel.Output>.self) var context
        
        public var body: AnyContent {
            Main {
                Header {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Text {
                                context.view.title
                            }
                        }
                        StackColumn(size: .twelve) {
                            DropdownButton {
                                Anchor {
                                    "Create"
                                }
                                .reference("context.route.baseUrl/create")
                                .class("dropdown-action")
                                Anchor {
                                    Italic {
                                    }
                                    .class("fas fa-caret-down")
                                }
                                .class("dropdown-menu-toggle js_toggle")
                                DropdownMenu {
                                    DropdownItem {
                                        DropdownLink {
                                            "Import"
                                        }
                                    }
                                    DropdownItem {
                                        DropdownLink {
                                            "Export"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Section {
                    Stack(direction: .vertical) {
                        StackColumn(size: .twelve) {
                            ListContainer {
                                ListHeader {
                                }
                                ListBody {
                                }
                                ListFooter {
                                }
                            }
                        }
                    }
                }
                Footer {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
    
    struct CreateView: View {
     
        @TemplateValue(CreateContext<ArticleModel.Output>.self)  var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
    
    struct EditView: View {
        
        @TemplateValue(EditContext<ArticleModel.Output>.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
}
