import HTMLKit
import HTMLKitComponents

public struct PageContainer: View {
    
    public var content: [BodyElement]
    
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }

    public var body: Content {
        Document(.html5)
        Html {
            Head {
                Meta()
                    .charset(.utf8)
                Meta()
                    .name(.viewport)
                    .content("width=device-width, initial-scale=1.0")
                Title {
                    "mattesmohr"
                }
                Link()
                    .relationship(.stylesheet)
                    .reference("/css/page.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/htmlkit/all.css")
                Script {
                }
                .source("/htmlkit/all.js")
            }
            Body {
                content
            }
        }
    }
}
