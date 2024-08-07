import HTMLKit
import HTMLKitComponents

enum HomePage {
    
    struct IndexView: View {

        var viewModel: HomePageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    Text {
                        viewModel.title
                    }
                    .textStyle(.subheadline)
                }
                Section {
                    Carousel {
                        Slide {
                            VStack(alignment: .center, spacing: .around) {
                                MacIcon()
                            }
                        }
                        .backgroundColor(.system)
                        .tag("slide1")
                        Slide {
                            VStack(alignment: .center, spacing: .around) {
                                SafariIcon()
                            }
                        }
                        .backgroundColor(.system)
                        .tag("slide2")
                    }
                    .borderShape(.smallrounded)
                }
                Section {
                    VStack(alignment: .center, spacing: .large) {
                        Text("headline.about")
                            .textStyle(.subheadline)
                        Text {
                            "Developer. Swift. Server Side."
                        }
                        .textStyle(.headline)
                        Text {
                            MarkdownString {
                                "Hi there, I am **Mattes**. A developer from **Bavaria, Germany**. I am building websites for living."
                            }
                        }
                        .fontSize(.medium)
                        .frame(width: .eight)
                    }
                    .tag("about")
                }
                Section {
                    VStack(alignment: .center, spacing: .large) {
                        Text("headline.projects")
                            .textStyle(.subheadline)
                        Text {
                            "Open Source. Vapor. Community."
                        }
                        .textStyle(.headline)
                        Text {
                            MarkdownString {
                                "The majority of my spare time is dedicated to **open source** contributions."
                            }
                        }
                        .fontSize(.medium)
                        .frame(width: .eight)
                        VStack(spacing: .large) {
                            Scroll {
                                HStack(alignment: .top, spacing: .small) {
                                    for project in viewModel.pagination.items {
                                        Link(destination: "/projects/\(project.slug)") {
                                            VStack(spacing: .small) {
                                                Thumbnail {
                                                    switch project.category {
                                                    case "macos":
                                                        MacIcon()
                                                    default:
                                                        SafariIcon()
                                                    }
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
                                .frame(width: .twelve)
                            }
                            HStack {
                                Link(destination: "/projects") {
                                    "View all projects"
                                }
                                .foregroundColor(.blue)
                                .bold()
                            }
                        }
                    }
                    .tag("projects")
                }
            }
        }
    }
}
