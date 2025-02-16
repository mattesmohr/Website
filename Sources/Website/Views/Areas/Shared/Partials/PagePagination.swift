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
                if let previousPage = meta.previousPage {
                    Link(destination: "?page=\(previousPage)") {
                        Symbol(system: .chevron(.left))
                    }
                } else {
                    Link(destination: "") {
                        Symbol(system: .chevron(.left))
                    }
                    .foregroundColor(.gray)
                }
                if let nextPage = meta.nextPage {
                    Link(destination: "?page=\(nextPage)") {
                        Symbol(system: .chevron(.right))
                    }
                } else {
                    Link(destination: "") {
                        Symbol(system: .chevron(.right))
                    }
                    .foregroundColor(.gray)
                }
            }
        }
        .navigationStyle(.pagination)
        .borderShape(.smallrounded)
        Text("Page \(meta.currentPage) of \(meta.totalPages)")
    }
}
