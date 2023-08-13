import Foundation

struct Pagination<T: Sequence> {
    
    var items: T
    
    var currentPage: Int
    
    var pageSize: Int
    
    var totalItems: Int
    
    var totalPages: Int {
        return Int(ceil(Double(totalItems) / Double(pageSize)))
    }
    
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
    
    init(items: T, current: Int = 1, size: Int = 1, total: Int) {
        
        self.items = items
        self.currentPage = current
        self.pageSize = size
        self.totalItems = total
    }
}
