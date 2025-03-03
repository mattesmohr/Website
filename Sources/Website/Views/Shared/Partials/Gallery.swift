import HTMLKit

struct Gallery: View {
    
    let content: [Content]
    
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
