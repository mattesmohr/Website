import HTMLKit
import HTMLKitComponents

enum ProjectPage {
    
    struct IndexView: View {

        var viewModel: ProjectPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack(spacing: .medium) {
                        Text {
                            viewModel.title
                        }
                        .textStyle(.subheadline)
                        Text {
                            MarkdownString {
                                "To do what I love, I rely on software and the individuals behind that craft. Contributing to a **community** is my means of expressing gratitude and **giving back**. Explore the projects I'm involved with."
                            }
                        }
                        .fontSize(.medium)
                    }
                }
                Section {
                    Tabs(direction: .horizontal) {
                        Pane {
                            Grid(ratio: .half, horizontalSpacing: .medium, verticalSpacing: .large) {
                                for project in viewModel.pagination.items {
                                    Link(destination: "/projects/\(project.slug)") {
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
                                                project.excerpt
                                            }
                                            .lineLimit(.three)
                                        }
                                    }
                                }
                            }
                        } label: {
                            Text {
                                "All"
                            }
                        }
                        .badge(viewModel.pagination.items.count)
                        .tag("all")
                        Pane {
                            Grid(ratio: .half, horizontalSpacing: .medium, verticalSpacing: .large) {
                                for project in viewModel.pagination.items.filter({$0.category == "ios"}) {
                                    Link(destination: "/projects/\(project.slug)") {
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
                                                project.excerpt
                                            }
                                            .lineLimit(.three)
                                        }
                                    }
                                }
                            }
                        } label: {
                            Text {
                                "iOS"
                            }
                        }
                        .tag("ios")
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
                    VStack(spacing: .large) {
                        Thumbnail {
                            SafariIcon()
                        }
                        HStack(alignment: .top, spacing: .large) {
                            VStack(spacing: .small) {
                                Text {
                                    viewModel.project.title
                                }
                                .fontSize(.large)
                                Text {
                                    MarkdownString(viewModel.project.content)
                                }
                                .fontSize(.medium)
                            }
                            .frame(width: .nine)
                            VStack(spacing: .large) {
                                VStack(spacing: .small) {
                                    Text {
                                        "Gallerie"
                                    }
                                    Gallery {}
                                }
                                VStack {
                                    Text("detail.category")
                                    Text {
                                        if let category = ProjectModel.Categories(rawValue: viewModel.project.category) {
                                            category.description
                                        }
                                    }
                                    .bold()
                                }
                                if let documentation = viewModel.project.documentation {
                                    VStack {
                                        Text("detail.documentation")
                                        Link(destination: documentation, target: .blank) {
                                            Text {
                                                "Github"
                                            }
                                            .bold()
                                        }
                                    }
                                }
                                if let repository = viewModel.project.repository {
                                    VStack {
                                        Text("detail.repository")
                                        Link(destination: repository, target: .blank) {
                                            Text {
                                                "Github"
                                            }
                                            .bold()
                                        }
                                    }
                                }
                            }
                            .frame(width: .three)
                        }
                    }
                }
            }
        }
    }
}
