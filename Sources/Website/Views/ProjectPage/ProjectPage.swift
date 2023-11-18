import HTMLKit
import HTMLKitComponents

enum ProjectPage {
    
    struct IndexView: View {

        var viewModel: ProjectPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .font(.subheadline)
                    Text {
                        "Explore, what I do in my free time."
                    }
                    .font(.headline)
                }
                Section {
                    Grid(ratio: .half) {
                        for project in viewModel.pagination.items {
                            Link(destination: "/projects/show/\(project.id)") {
                                VStack {
                                    Thumbnail {
                                        SafariIcon()
                                    }
                                    Text {
                                        project.category
                                    }
                                    .fontSize(.small)
                                    .foregroundColor(.blue)
                                    .bold()
                                    Text {
                                        project.title
                                    }
                                    .bold()
                                    Text {
                                        project.content
                                    }
                                }
                                .contentSpace(.small)
                            }
                        }
                    }
                    .contentSpace(.small)
                }
            }
        }
    }
    
    struct ShowView: View {

        var viewModel: ProjectPageModel.ShowView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .font(.subheadline)
                    Text {
                        viewModel.project.title
                    }
                    .font(.headline)
                }
                Section {
                    VStack {
                        Thumbnail {
                            SafariIcon()
                        }
                        Text {
                            viewModel.project.content
                        }
                    }
                    .contentSpace(.small)
                }
            }
        }
    }
}
