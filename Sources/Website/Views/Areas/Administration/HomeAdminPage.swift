import HTMLKit
import HTMLKitComponents

enum HomeAdminPage {
    
    struct IndexView: View {
        
        var context: EmptyContext
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        StackColumn(size: .twelve) {
                            Text {
                                "Hello again!"
                            }
                            .fontSize(.medium)
                            .fontWeight(.medium)
                        }
                    }
                }
                Section {
                    HStack(alignment: .top) {
                        StackColumn(size: .four) {
                            Card {
                            }
                        }
                        StackColumn(size: .four) {
                            Card {
                            }
                        }
                        StackColumn(size: .four) {
                            Card {
                            }
                        }
                    }
                }
                Aside {
                }
                Footer {
                    HStack {
                        StackColumn(size: .twelve) {
                        }
                    }
                }
            }
        }
    }
}
