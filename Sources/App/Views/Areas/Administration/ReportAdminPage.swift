import HTMLKit
import HTMLKitComponents

struct ReportAdminPage {
    
    var views: [View] = [IndexView()]
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self)
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
