import Foundation

struct Pagination<T: Sequence> {
    
    struct Meta {
        
        var previousPage: Int? {
            
            if currentPage > 1 {
                return currentPage - 1
            }
            
            return nil
        }
        
        var nextPage: Int? {
            
            if currentPage < totalPages {
                return currentPage + 1
            }
            
            return nil
        }
        
        var totalPages: Int {
            return Int(ceil(Double(totalItems) / Double(pageSize)))
        }
        
        var currentPage: Int
        
        var pageSize: Int
        
        var totalItems: Int
        
        init(currentPage: Int, pageSize: Int, totalItems: Int) {
            
            self.currentPage = currentPage
            self.pageSize = pageSize
            self.totalItems = totalItems
        }
    }
    
    var items: T
    
    var meta: Meta
    
    
    init(items: T, currentPage: Int = 1, pageSize: Int = 1, totalItems: Int) {
        
        self.items = items
        self.meta = Meta(currentPage: currentPage, pageSize: pageSize, totalItems: totalItems)
    }
}
