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
                    HStack {
                        Card {
                            Tabs(direction: .horizontal) {
                                Pane {
                                    Chart {
                                        for project in viewModel.projects {
                                            SectorMark(value: project.count, label: project.name)
                                                .foregroundColor(.random)
                                        }
                                    }
                                    .innerRadius(.large)
                                } label: {
                                    Text {
                                        "Pie"
                                    }
                                }
                                .tag("piechart")
                                Pane {
                                    Chart {
                                        for project in viewModel.projects {
                                            BarMark(value: project.count, label: project.name)
                                                .foregroundColor(.random)
                                        }
                                    }
                                } label: {
                                    Text {
                                        "Bar"
                                    }
                                }
                                .tag("barchart")

                            }
                        }
                        .frame(width: .twelve)
                        .borderShape(.smallrounded)
                    }
                }
            }
        }
    }
}
