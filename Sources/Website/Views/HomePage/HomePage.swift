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
                    .backgroundColor(.red)
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
                    HStack(spacing: .around) {
                        Text("headline.about")
                            .textStyle(.subheadline)
                    }
                    HStack(spacing: .around) {
                        Text {
                            "Work. Life. Balance."
                        }
                        .textStyle(.headline)
                    }
                    HStack(spacing: .around) {
                        Text {
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                        }
                        .foregroundColor(.gray)
                    }
                }
                Section {
                    HStack(spacing: .around) {
                        Text("headline.projects")
                            .textStyle(.subheadline)
                    }
                    HStack(spacing: .around) {
                        Text {
                            "Experience. Knowledge. Skill."
                        }
                        .textStyle(.headline)
                    }
                    HStack(spacing: .around) {
                        Text {
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                        }
                        .foregroundColor(.gray)
                    }
                    VStack(spacing: .large) {
                        Scroll {
                            HStack(alignment: .top, spacing: .small) {
                                for project in viewModel.pagination.items {
                                    Link(destination: "/projects/show/\(project.id)") {
                                        VStack(spacing: .small) {
                                            Thumbnail {
                                                switch project.category {
                                                case "macOS":
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
                                                project.content
                                            }
                                            .foregroundColor(.gray)
                                            .lineLimit(.three)
                                        }
                                    }
                                }
                            }
                            .tag("projects")
                            .frame(width: .twelve)
                        }
                        HStack {
                            Link(destination: "/projects/index") {
                                "View all projects"
                            }
                            .foregroundColor(.blue)
                            .bold()
                        }
                    }
                }
            }
        }
    }
}
