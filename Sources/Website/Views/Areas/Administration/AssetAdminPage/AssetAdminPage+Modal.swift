import Foundation
import HTMLKit
import HTMLKitComponents

extension AssetAdminPage {
    
    struct DeleteModal: View {
        
        let id: UUID
        
        var body: Content {
            Modal {
                VStack(spacing: .small) {
                    Text("Do you really want to delete it? It cannot be undone.")
                    HStack(spacing: .small) {
                        LinkButton(destination: "/area/admin/assets/\(id)/delete") {
                            Text("Delete")
                        }
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
