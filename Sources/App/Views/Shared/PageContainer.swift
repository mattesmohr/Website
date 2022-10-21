import HTMLKit
import HTMLKitComponents

public struct PageContainer: Page {
    
    public var content: [BodyElement]
    
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }

    public var body: AnyContent {
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
                    .reference("/css/components/all.css")
                Script {
                }
                .source("/js/all.js")
            }
            Body {
                content
                Script {
                }
            }
        }
    }
    
    public var scripts: BodyElement {        
        return [content.scripts]
    }
}

extension Array: AnyElement where Element == AnyContent {}

extension Array: BodyElement where Element == AnyContent {}
