extension Array {
    
    /// Create a pagination.
    ///
    /// - Parameters:
    ///   - page: The page number to evaluate.
    ///   - limit: The number of items to retrieve.
    ///
    /// - Returns: The pagination
    func page(at page: Int, per limit: Int) -> Pagination<Self>? {
        
        guard page > 0 && limit > 0 else {
            return nil
        }
        
        guard self.count > 0 else {
            return Pagination(items: [], currentPage: page, pageSize: limit, totalItems: self.count)
        }
        
        // The lower bound for the range
        let offset = Swift.max((page - 1) * limit, 0)
        
        // The upper bound for the range
        let cap = Swift.min(offset + limit, self.count)
        
        // Validate the range first
        guard offset < cap else {
            return nil
        }
    
        return Pagination(items: Array(self[offset..<cap]), currentPage: page, pageSize: limit, totalItems: self.count)
    }
}
