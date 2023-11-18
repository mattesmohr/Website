import HTMLKit
import HTMLKitComponents

struct Thumbnail: View {
    
    var content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    var body: Content {
        Division {
            content
        }
        .class("thumbnail")
    }
}
