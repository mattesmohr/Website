import Foundation
import HTMLKit
import HTMLKitComponents

extension ProjectAdminPage {
    
    struct DeleteModal: View {
        
        let id: Int
        
        var body: Content {
            Modal {
                VStack(spacing: .small) {
                    Text("Do you really want to delete it? It cannot be undone.")
                    HStack(spacing: .small) {
                        LinkButton("Delete", destination: "/area/admin/projects/\(id)/delete")
                            .borderShape(.smallrounded)
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
            .borderShape(.smallrounded)
            .tag("delete-modal")
        }
    }
}
