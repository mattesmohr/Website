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

struct Feed: View {
    
    var content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    var body: Content {
        Division {
            for item in content {
                Division {
                    Division {
                        item
                    }
                    .class("new")
                }
                .class("feed-item")
            }
        }
        .class("feed")
    }
}
