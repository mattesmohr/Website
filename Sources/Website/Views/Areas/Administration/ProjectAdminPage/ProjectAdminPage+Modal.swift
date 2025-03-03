import Foundation
import HTMLKit
import HTMLKitComponents

extension ProjectAdminPage {
    
    struct DeleteModal: View {
        
        let id: UUID
        
        var body: Content {
            Modal {
                VStack(spacing: .small) {
                    Text("Do you really want to delete it? It cannot be undone.")
                    HStack(spacing: .small) {
                        LinkButton(destination: "/area/admin/projects/\(id)/delete") {
                            LocalizedString(key: "Delete")
                        }
                        .borderShape(.smallrounded)
                        .buttonStyle(.primary)
                        Button(role: .button) {
                            LocalizedString(key: "Cancel")
                        }
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
