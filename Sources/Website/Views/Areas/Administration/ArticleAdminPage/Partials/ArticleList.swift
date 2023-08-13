import HTMLKit
import HTMLKitComponents

struct ArticleList: View {
    
    var articles: [ArticleModel.Output]
    
    var body: Content {
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
                            Symbol(system: "actions")
                        }
                        .frame(width: .two)
                        .borderShape(.smallrounded)
                    }
                }
            }
        }
        .listStyle(.listgroup)
        .frame(width: .twelve)
    }
}
