import HTMLKit

struct Feed: View {
    
    var content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    var body: Content {
        Division {
            for item in content {
                Article {
                    item
                }
                .class("article")
            }
        }
        .class("feed")
    }
}
