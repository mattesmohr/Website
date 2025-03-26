import HTMLKit
import HTMLKitComponents

enum ProjectPage {
    
    struct IndexView: View {

        let viewModel: ProjectPageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack(spacing: .medium) {
                        Text(viewModel.title)
                            .textStyle(.subheadline)
                        Text {
                            MarkdownString {
                                "To do what I love, I rely on software and the individuals behind that craft. Contributing to a \(bold: "community") is my means of expressing gratitude and \(bold: "giving back"). Explore the projects I'm involved with."
                            }
                        }
                        .fontSize(.medium)
                    }
                }
                Section {
                    Tabs(direction: .horizontal) {
                        Pane {
                            Grid(ratio: .third, horizontalSpacing: .medium, verticalSpacing: .large) {
                                for project in viewModel.pagination.items {
                                    Link(destination: "/projects/\(project.slug)") {
                                        VStack(spacing: .small) {
                                            Thumbnail {
                                                SafariIcon()
                                            }
                                            Text(project.category.localizedDescription)
                                                .fontSize(.small)
                                                .foregroundColor(.accent)
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
                            Text("All")
                        }
                        .badge(viewModel.pagination.items.count)
                        .tag("all")
                        Pane {
                            Grid(ratio: .third, horizontalSpacing: .medium, verticalSpacing: .large) {
                                for project in viewModel.pagination.items.filter({$0.category == .ios}) {
                                    Link(destination: "/projects/\(project.slug)") {
                                        VStack(spacing: .small) {
                                            Thumbnail {
                                                SafariIcon()
                                            }
                                            Text(project.category.localizedDescription)
                                                .fontSize(.small)
                                                .foregroundColor(.accent)
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
                        Pane {
                            Grid(ratio: .third, horizontalSpacing: .medium, verticalSpacing: .large) {
                                for project in viewModel.pagination.items.filter({$0.category == .macos}) {
                                    Link(destination: "/projects/\(project.slug)") {
                                        VStack(spacing: .small) {
                                            Thumbnail {
                                                SafariIcon()
                                            }
                                            Text(project.category.localizedDescription)
                                                .fontSize(.small)
                                                .foregroundColor(.accent)
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
                                "macOS"
                            }
                        }
                        .tag("macos")
                        Pane {
                            Grid(ratio: .third, horizontalSpacing: .medium, verticalSpacing: .large) {
                                for project in viewModel.pagination.items.filter({$0.category == .server}) {
                                    Link(destination: "/projects/\(project.slug)") {
                                        VStack(spacing: .small) {
                                            Thumbnail {
                                                SafariIcon()
                                            }
                                            Text(project.category.localizedDescription)
                                                .fontSize(.small)
                                                .foregroundColor(.accent)
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
                                "Swift on Server"
                            }
                        }
                        .tag("swiftserver")
                    }
                }
            }
        }
    }
    
    struct ShowView: View {

        let viewModel: ProjectPageModel.ShowView

        var body: Content {
            ViewContainer {
                Header {
                    Text(viewModel.title)
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
                            .tag("project-content")
                            VStack(spacing: .large) {
                                VStack(spacing: .small) {
                                    Text("Gallery")
                                    Gallery {}
                                }
                                VStack {
                                    Text("Category")
                                    Text(viewModel.project.category.localizedDescription)
                                        .bold()
                                }
                                if let documentation = viewModel.project.documentation {
                                    VStack {
                                        Text("Documentation")
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
                                        Text("Repository")
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
                            .tag("project-detail")
                        }
                    }
                    .tag("project")
                }
            }
        }
    }
}
