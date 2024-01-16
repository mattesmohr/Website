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
                    .textStyle(.subheadline)
                    Text {
                        "Explore, what I do in my free time."
                    }
                    .textStyle(.headline)
                }
                Section {
                    Grid(ratio: .half, spacing: .small) {
                        for project in viewModel.pagination.items {
                            Link(destination: "/projects/show/\(project.id)") {
                                VStack(spacing: .small) {
                                    Thumbnail {
                                        SafariIcon()
                                    }
                                    Text {
                                        if let category = ProjectModel.Categories(rawValue: project.category) {
                                            category.description
                                        }
                                    }
                                    .fontSize(.small)
                                    .foregroundColor(.blue)
                                    .bold()
                                    Text {
                                        project.title
                                    }
                                    .fontSize(.medium)
                                    Text {
                                        project.content
                                    }
                                    .foregroundColor(.gray)
                                    .lineLimit(.three)
                                }
                            }
                        }
                    }
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
                    .textStyle(.subheadline)
                }
                Section {
                    VStack(spacing: .small) {
                        Thumbnail {
                            SafariIcon()
                        }
                        Text {
                            viewModel.project.title
                        }
                        .fontSize(.large)
                        Text {
                            viewModel.project.content
                        }
                        .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
