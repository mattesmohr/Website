import HTMLKit
import HTMLKitComponents

struct ArticleList: View {
    
    let articles: [ArticleModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for article in articles {
                    HStack {
                        Text {
                            article.title
                        }
                        .frame(width: .four)
                        .lineLimit(.one)
                        Text(article.category.localizedDescription)
                            .frame(width: .two)
                            .lineLimit(.one)
                        Text(article.status.localizedDescription)
                            .frame(width: .two)
                            .lineLimit(.one)
                        Text {
                            article.modifiedAt.formatted(date: .short, time: .none)
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/articles/\(article.id)/edit") {
                                    Symbol(system: .pencil)
                                    Text {
                                        "Edit"
                                    }
                                }
                            }
                        } label: {
                            Symbol(system: .ellipsis(.horizontal))
                        }
                        .frame(width: .two)
                        .borderShape(.smallrounded)
                    }
                    .padding(insets: .vertical, length: .small)
                }
            }
            .listStyle(.listgroup)
        }
        .borderShape(.smallrounded)
        .margin(insets: .bottom, length: .medium)
    }
}
