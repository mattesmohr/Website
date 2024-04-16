import HTMLKit
import HTMLKitComponents

enum ImpressumPage {
    
    struct IndexView: View {

        var viewModel: ImpressumPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .textStyle(.subheadline)
                }
                Section {
                    VStack(spacing: .large) {
                        Text {
                            "This website represents me as a person and has no commercial use! Feel free to reach me via"
                        }
                        .fontSize(.medium)
                        VStack {
                            Text {
                                "Matthias Mohr"
                            }
                            .fontSize(.medium)
                            Text {
                                "Bamberg, Bavaria"
                            }
                            .fontSize(.medium)
                            Text {
                                "Germany"
                            }
                            .fontSize(.medium)
                            Text {
                                "mail@mattesmohr.de"
                            }
                            .fontSize(.medium)
                        }
                    }
                }
            }
        }
    }
}
