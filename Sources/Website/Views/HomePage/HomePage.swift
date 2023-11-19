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
                    .font(.subheadline)
                    .backgroundColor(.red)
                }
                Section {
                    Carousel {
                        Slide {
                            VStack(alignment: .center) {
                                MacIcon()
                            }
                            .contentSpace(.around)
                        }
                        .backgroundColor(.custom("aliceblue"))
                        .tag("slide1")
                        Slide {
                            VStack(alignment: .center) {
                                SafariIcon()
                            }
                            .contentSpace(.around)
                        }
                        .backgroundColor(.custom("aliceblue"))
                        .tag("slide2")
                    }
                    .borderColor(.custom("electricblue"))
                    .borderShape(.smallrounded)
                }
                Section {
                    HStack {
                        Text("headline.about")
                            .font(.subheadline)
                    }
                    .contentSpace(.around)
                    HStack {
                        Text {
                            "Work. Life. Balance."
                        }
                        .font(.headline)
                    }
                    .contentSpace(.around)
                    HStack {
                        Text {
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                        }
                        .foregroundColor(.gray)
                    }
                    .contentSpace(.around)
                }
                Section {
                    HStack {
                        Text("headline.projects")
                            .font(.subheadline)
                    }
                    .contentSpace(.around)
                    HStack {
                        Text {
                            "Experience. Knowledge. Skill."
                        }
                        .font(.headline)
                    }
                    .contentSpace(.around)
                    HStack {
                        Text {
                            "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
                        }
                        .foregroundColor(.gray)
                    }
                    .contentSpace(.around)
                    VStack {
                        ScrollView(direction: .horizontal) {
                            HStack(alignment: .top) {
                                for project in viewModel.pagination.items {
                                    Link(destination: "/projects/show/\(project.id)") {
                                        VStack {
                                            Thumbnail {
                                                switch project.category {
                                                case "macOS":
                                                    MacIcon()
                                                default:
                                                    SafariIcon()
                                                }
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
                                            .foregroundColor(.gray)
                                        }
                                        .contentSpace(.small)
                                    }
                                }
                            }
                            .tag("projects")
                            .frame(width: .twelve)
                            .contentSpace(.small)
                        }
                        HStack {
                            Link(destination: "/projects/index") {
                                "View all projects"
                            }
                            .foregroundColor(.blue)
                            .bold()
                        }
                    }
                    .contentSpace(.large)
                }
            }
        }
    }
}
