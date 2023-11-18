import HTMLKit
import HTMLKitComponents

struct SafariIcon: View {
    
    var body: Content {
        Division {
            Division {
                Division {
                }
                .class("safari-button red")
                Division {
                }
                .class("safari-button yellow")
                Division {
                }
                .class("safari-button green")
            }
            .class("safari-navigation")
            Division {
                Division {
                    Paragraph {
                        "Github"
                    }
                    .class("tab active")
                    Paragraph {
                        "Vapor"
                    }
                    .class("tab")
                }
                .class("window-tabbar")
                Division {
                }
                .class("loadingbar")
            }
            .class("safari-window")
        }
        .class("safari-frame")
    }
}
