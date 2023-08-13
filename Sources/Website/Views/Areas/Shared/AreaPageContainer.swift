import HTMLKit
import HTMLKitComponents

struct AreaPageContainer: View {
    
    var content: [BodyElement]
    
    init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }

    var body: Content {
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
                    .reference("/htmlkit/all.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/css/area.css")
                Script {
                }
                .source("/htmlkit/query.js")
            }
            Body {
                content
                Script {
                }
                .source("/htmlkit/all.js")
            }
        }
    }
}
