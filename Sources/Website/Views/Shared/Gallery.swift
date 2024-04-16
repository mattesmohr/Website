import HTMLKit
import HTMLKitComponents

struct Gallery: View {
    
    var content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    var body: Content {
        Division {
            Division {
            }
            .class("item")
            Division {
            }
            .class("item")
            Division {
            }
            .class("item")
            Division {
            }
            .class("item")
            Division {
            }
            .class("item")
        }
        .class("gallery")
    }
}
