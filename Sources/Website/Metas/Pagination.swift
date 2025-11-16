/// A type that represents a pagination.
struct Pagination<T: Sequence> {
    
    /// A type that holds the information about the pagination.
    struct Meta {
        
        /// The number of the current page.
        let currentPage: Int
        
        /// The number of items per page.
        let pageSize: Int
        
        /// The total number of items.
        let totalItems: Int
        
        /// The number of the previous page.
        var previousPage: Int? {
            
            if currentPage > 1 {
                return currentPage - 1
            }
            
            return nil
        }
        
        /// The number of the next page.
        var nextPage: Int? {
            
            if currentPage < totalPages {
                return currentPage + 1
            }
            
            return nil
        }
        
        /// The total number of pages.
        var totalPages: Int {
            return Swift.max((totalItems + pageSize - 1) / pageSize, 1)
        }
        
        /// Create the meta.
        ///
        /// - Parameters:
        ///   - currentPage: The number of the current page.
        ///   - pageSize: The size of the current page.
        ///   - totalItems: The total number of items.
        init(currentPage: Int, pageSize: Int, totalItems: Int) {
            
            self.currentPage = currentPage
            self.pageSize = pageSize
            self.totalItems = totalItems
        }
    }
    
    /// The slice of items for the pagination.
    let items: T
    
    /// The meta information of the pagination.
    let meta: Meta
    
    /// Create a pagination
    ///
    /// - Parameters:
    ///   - items: The items to show.
    ///   - currentPage: The current position within the pagination.
    ///   - pageSize: The page size to limit.
    ///   - totalItems: The total number of items.
    init(items: T, currentPage: Int = 1, pageSize: Int = 1, totalItems: Int) {
        
        self.items = items
        self.meta = Meta(currentPage: currentPage, pageSize: pageSize, totalItems: totalItems)
    }
}
