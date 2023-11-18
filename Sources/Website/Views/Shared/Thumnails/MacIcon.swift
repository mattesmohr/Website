import HTMLKit
import HTMLKitComponents

struct MacIcon: View {
    
    var body: Content {
        Division {
            Division {
                Division {
                }
                .class("app finder")
                Division {
                }
                .class("app message")
                Division {
                }
                .class("app safari")
                Division {
                }
                .class("app xcode")
                Division {
                }
                .class("app playground")
                Division {
                }
                .class("app affinity")
                Division {
                }
                .class("app terminal")
                Division {
                }
                .class("app settings")
            }
            .class("dockbar")
        }
        .class("mac-frame")
    }
}
