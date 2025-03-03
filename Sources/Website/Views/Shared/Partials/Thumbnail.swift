import HTMLKit

struct Thumbnail: View {
    
    let content: [Content]
    
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
