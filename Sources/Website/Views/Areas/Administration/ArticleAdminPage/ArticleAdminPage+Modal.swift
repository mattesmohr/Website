import Foundation
import HTMLKit
import HTMLKitComponents

extension ArticleAdminPage {
    
    struct DeleteModal: View {
        
        let id: Int
        
        var body: Content {
            Modal {
                VStack(spacing: .small) {
                    Text("Do you really want to delete it? It cannot be undone.")
                    HStack(spacing: .small) {
                        LinkButton("Delete", destination: "/area/admin/articles/\(id)/delete")
                            .border(.system, shape: .smallrounded)
                            .buttonStyle(.primary)
                        Button("Cancel", role: .button)
                            .buttonStyle(ControlButton())
                            .tag("close")
                            .onClick { action in
                                action.close("delete-modal")
                            }
                    }
                }
            }
            .frame(width: .three)
            .border(.system, shape: .smallrounded)
            .tag("delete-modal")
        }
    }
}
