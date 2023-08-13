import HTMLKit
import HTMLKitComponents

enum ConditionPage {
    
    struct IndexView: View {

        var viewModel: ConditionPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .font(.subheadline)
                        Text {
                            "Lorem ipsum"
                        }
                        .font(.headline)
                        List(direction: .horizontal) {
                            ListRow {
                                Link(destination: "#terms") {
                                    "Terms of use"
                                }
                            }
                            ListRow {
                                Link(destination: "#privacy") {
                                    "Privacy policy"
                                }
                            }
                            ListRow {
                                Link(destination: "#links") {
                                    "Links"
                                }
                            }
                        }
                    }
                }
                Section {
                    VStack {
                        Text {
                            "Privacy policy"
                        }
                        Text {
                            "Terms of use"
                        }
                        Text {
                            "Links"
                        }
                    }
                }
            }
        }
    }
}
