import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

public struct PageContainer: Page {
    
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
                    .reference("/css/frontend.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/css/images.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("https://cdn.mattesmohr.de/honeycomb/css/all.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("https://cdn.mattesmohr.de/fontawesome/css/all.css")
            }
            Body {
                content
            }
        }
    }
}
