import HTMLKit
import HTMLKitComponents

struct ArticleList: View {
    
    var articles: [ArticleModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for article in articles {
                    ListRow {
                        HStack {
                            Text {
                                article.title
                            }
                            .frame(width: .four)
                            Text {
                                article.category
                            }
                            .frame(width: .two)
                            Text {
                                article.status
                            }
                            .frame(width: .two)
                            Text {
                                article.modifiedAt.formatted(date: .short, time: .none)
                            }
                            .frame(width: .two)
                            Dropdown {
                                List(direction: .vertical) {
                                    ListRow {
                                        Link(destination: "/area/admin/articles/edit/\(article.id)") {
                                            Symbol(system: "folder")
                                            Text {
                                                "Edit"
                                            }
                                        }
                                    }
                                    Divider()
                                    ListRow {
                                        Link(destination: "/area/admin/articles/delete/\(article.id)") {
                                            Symbol(system: "folder")
                                            Text {
                                                "Delete"
                                            }
                                        }
                                    }
                                }
                            } label: {
                                Text {
                                    "\u{2981}\u{2981}\u{2981}"
                                }
                            }
                            .frame(width: .two)
                            .borderShape(.smallrounded)
                        }
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
