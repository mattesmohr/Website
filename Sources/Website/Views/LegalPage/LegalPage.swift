import HTMLKit
import HTMLKitComponents

enum LegalPage {
    
    struct IndexView: View {

        var viewModel: LegalPageModel.IndexView

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
                        Text("This website represents me as a person and has no commercial use!")
                            .fontSize(.medium)
                        VStack {
                            Text("Responsible for the content")
                                .bold()
                                .fontSize(.medium)
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
