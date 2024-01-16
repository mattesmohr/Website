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
                        .textStyle(.subheadline)
                        Text {
                            "Lorem ipsum"
                        }
                        .textStyle(.headline)
                        List(direction: .horizontal) {
                            Link(destination: "#terms") {
                                "Terms of use"
                            }
                            Link(destination: "#privacy") {
                                "Privacy policy"
                            }
                            Link(destination: "#links") {
                                "Links"
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
