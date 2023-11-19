import HTMLKit
import HTMLKitComponents

struct PagePagination<T: Sequence>: View {
    
    let meta: Pagination<T>.Meta
    
    init(meta: Pagination<T>.Meta) {
    
        self.meta = meta
    }
    
    var body: Content {
        Navigation {
            List(direction: .horizontal) {
                ListRow {
                    if let previousPage = meta.previousPage {
                        Link(destination: "?page=\(previousPage)") {
                            "Previous"
                        }
                    } else {
                        Link(destination: "") {
                            "Previous"
                        }
                        .foregroundColor(.gray)
                    }
                }
                ListRow {
                    if let nextPage = meta.nextPage {
                        Link(destination: "?page=\(nextPage)") {
                            "Next"
                        }
                    } else {
                        Link(destination: "") {
                            "Next"
                        }
                        .foregroundColor(.gray)
                    }
                }
            }
        }
        .navigationStyle(.pagination)
        .borderShape(.smallrounded)
        Text {
            "Page \(meta.currentPage) of \(meta.totalPages)"
        }
    }
}
