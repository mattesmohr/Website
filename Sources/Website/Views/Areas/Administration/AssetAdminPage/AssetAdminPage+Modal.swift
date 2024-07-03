import Foundation
import HTMLKit
import HTMLKitComponents

extension AssetAdminPage {
    
    struct DeleteModal: View {
        
        var id: UUID
        
        var body: Content {
            Modal {
                VStack(spacing: .small) {
                    Text {
                        "Do you really want to delete it? It cannot be undone."
                    }
                    HStack(spacing: .small) {
                        LinkButton(destination: "/area/admin/assets/\(id)/delete") {
                            "Delete"
                        }
                        .borderShape(.smallrounded)
                        .buttonStyle(.primary)
                        Button(role: .button) {
                            "Cancel"
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
