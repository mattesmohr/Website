import HTMLKit
import HTMLKitComponents

struct AreaPageContainer: View {
    
    let content: [BodyElement]
    
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
                    .content(verbatim: "width=device-width, initial-scale=1.0")
                Title {
                    "mattesmohr"
                }
                Link()
                    .relationship(.stylesheet)
                    .reference("/vendor/htmlkit/all.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/css/area.css")
                Script {
                }
                .source("/vendor/htmlkit/query.js")
            }
            Body {
                content
                Script {
                }
                .source("/js/area.js")
                Script {
                }
                .source("/vendor/htmlkit/all.js")
            }
        }
    }
}
