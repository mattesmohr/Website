import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ArticleAdminTemplate {
    
    struct IndexView: View {

        @TemplateValue(IndexContext<ArticleModel.Output>.self) var context
        
        public var body: AnyContent {
            Main {
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
