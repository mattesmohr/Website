import Vapor
import Fluent

struct RouteMetadata: Codable {
    
    var baseUrl: String = ""
    var currentArea: String?
    var currentController: String?
    var currentHandler: String?
    var currentItem: String?
    
    init(route: Route) {

        for index in 0...(route.path.count - 1) {
            
            if index == 0 {
                self.currentArea = route.path[index].description
                self.baseUrl.append("/\(currentArea!)")
            }
            
            if index == 1 {
                self.currentController = route.path[index].description
                self.baseUrl.append("/\(currentController!)")
            }
            
            if index == 2 {
                self.currentHandler = route.path[index].description
                self.baseUrl.append("/\(currentHandler!)")
            }
            
            if index == 3 {
                self.currentItem = route.path[index].description
            }
        }
    }
}

struct IdentityMetadata: Codable {
    
    var avatar: String?
    var email: String?
    var name: String?
    var status: String?
    
    init(user: UserModel.Output) {
        
        if let avatar = user.avatar {
            self.avatar = avatar.filePath
        }
        
        self.email = user.email
        self.name = user.firstName
        self.status = "online"
    }
}

struct ViewMetadata: Codable {
    
    var title: String?
}

struct PageMetadata: Codable {
    
    var totalItems: Int
    var pageSize: Int = 10
    var previousPage: Int?
    var currentPage: Int
    var nextPage: Int?
    var totalPages: Int = 1
    
    var hasPrevious: Bool = false
    var hasNext: Bool = false
    var hasItems: Bool = false
    
    init(metadata: Fluent.PageMetadata) {
        
        self.totalItems = metadata.total
        self.currentPage = metadata.page
        self.pageSize = metadata.per
        
        let total = Int(ceil(Double(metadata.total) / Double(metadata.per)))
        
        if total > 0 {
            self.totalPages = total
        }
        
        if self.totalItems > 0 {
            self.hasItems = true
        }
        
        if self.currentPage > 1 {
            self.previousPage = currentPage - 1
            self.hasPrevious = true
        }
        
        if (self.currentPage + 1) < totalPages {
            self.nextPage = currentPage + 1
            self.hasNext = true
        }
    }
}

