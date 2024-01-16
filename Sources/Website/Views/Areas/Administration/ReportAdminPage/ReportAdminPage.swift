import HTMLKit
import HTMLKitComponents

enum ReportAdminPage {
    
    struct IndexView: View {
        
        var viewModel: ReportAdminPageModel.IndexView
        
        var body: Content {
            AreaViewContainer {
                Header {
                    HStack {
                        Text {
                            viewModel.title
                        }
                        .fontSize(.medium)
                        .fontWeight(.medium)
                    }
                }
                Section {
                    Card {
                        List(direction: .vertical) {
                            for project in viewModel.projects {
                                HStack {
                                    Text {
                                        project.name
                                    }
                                    .frame(width: .eleven)
                                    Text {
                                        "\(project.count)"
                                    }
                                    .frame(width: .one)
                                }
                                .padding(insets: .vertical, length: .small)
                            }
                        }
                        .listStyle(.listgroup)
                    }
                    .frame(width: .four)
                    .borderShape(.smallrounded)
                }
            }
        }
    }
}
