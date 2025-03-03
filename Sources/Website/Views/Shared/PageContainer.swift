import HTMLKit
import HTMLKitComponents

struct PageContainer: View {
    
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
                    .content("width=device-width, initial-scale=1.0")
                Title {
                    "mattesmohr"
                }
                Link()
                    .relationship(.stylesheet)
                    .reference("/htmlkit/all.css")
                Link()
                    .relationship(.stylesheet)
                    .reference("/css/page.css")
                Script {
                }
                .source("/htmlkit/query.js")
            }
            Body {
                content
                Script {
                }
                .source("/js/page.js")
                Script {
                }
                .source("/htmlkit/all.js")
            }
        }
        .language(.english)
    }
}
