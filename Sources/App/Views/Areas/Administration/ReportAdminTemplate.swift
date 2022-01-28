import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

enum ReportAdminTemplate {
    
    struct IndexView: View {

        @TemplateValue(EmptyContext.self) var context
        
        var body: AnyContent {
            Division {
            }
        }
    }
}
