import Fluent

extension Array {
    
    func page(page: Int, per: Int) -> Pagination<Self> {
        
        let start = (page - 1) * per
        let end = ((page - 1) * per) + per
        let bound = Swift.max(self.count - 1, 0)
        
        if start == bound {
            return Pagination(items: self, currentPage: page, pageSize: per, totalItems: self.count)
        }
        
        if start > bound {
            return Pagination(items: Array(self[bound...bound]), currentPage: page, pageSize: per, totalItems: self.count)
        }
        
        if end > bound {
            return Pagination(items: Array(self[start...bound]), currentPage: page, pageSize: per, totalItems: self.count)
        }
    
        return Pagination(items: Array(self[start...(end - 1)]), currentPage: page, pageSize: per, totalItems: self.count)
    }
}
