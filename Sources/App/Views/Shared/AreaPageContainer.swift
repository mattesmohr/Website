import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

public struct AreaPageContainer: Page {
    
    public var content: [BodyElement]
    
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }

    public var body: AnyContent {
        Document(type: .html5)
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
                    .reference("/css/area.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/css/components/all.css")
            }
            Body {
                content
            }
        }
    }
}
