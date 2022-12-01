import HTMLKit
import HTMLKitComponents

struct HomeAdminPage {
    
    var views: [View] = [IndexView()]
    
    struct IndexView: View {
        
        @TemplateValue(EmptyContext.self)
        var context
        
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
}
