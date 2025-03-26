import HTMLKit
import HTMLKitComponents

enum HomePage {
    
    struct IndexView: View {

        let viewModel: HomePageModel.IndexView

        var body: Content {
            ViewContainer {
                Header {
                    VStack(spacing: .medium) {
                        Text(viewModel.title)
                            .textStyle(.subheadline)
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
                        .frame(width: .twelve)
                        .borderShape(.smallrounded)
                    }
                }
                Section {
                    VStack(alignment: .center, spacing: .large) {
                        Text("About")
                            .textStyle(.subheadline)
                        Text(alignment: .center) {
                            "Developer. Swift. Server Side."
                        }
                        .textStyle(.headline)
                        Text(alignment: .center) {
                            MarkdownString {
                                "Hi there, I am \(bold: "Mattes"). A developer from \(bold: "Bavaria, Germany"). I am building websites for living."
                            }
                        }
                        .fontSize(.medium)
                    }
                    .tag("about")
                    VStack(alignment: .center, spacing: .large) {
                        Text("Projects")
                            .textStyle(.subheadline)
                        Text(alignment: .center) {
                            "Open Source. Vapor. Community."
                        }
                        .textStyle(.headline)
                        Text(alignment: .center) {
                            MarkdownString {
                                "The majority of my spare time is dedicated to \(bold: "open source") contributions."
                            }
                        }
                        .fontSize(.medium)
                        VStack(spacing: .large) {
                            Scroll(showIndicators: false) {
                                HStack(alignment: .top, spacing: .small) {
                                    for project in viewModel.pagination.items {
                                        Link(destination: "/projects/\(project.slug)") {
                                            VStack(spacing: .small) {
                                                Thumbnail {
                                                    switch project.category {
                                                    case .macos:
                                                        MacIcon()
                                                    case .ios:
                                                        PadIcon()
                                                    default:
                                                        PadIcon()
                                                    }
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
                                        .frame(width: .four)
                                    }
                                }
                                .frame(width: .twelve)
                            }
                            HStack {
                                Link(destination: "/projects") {
                                    LocalizedString(key: "View all")
                                }
                                .foregroundColor(.accent)
                            }
                        }
                    }
                    .tag("projects")
                }
            }
        }
    }
}
