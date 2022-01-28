import Vapor

struct ReportModel: Content {
    
    var id: UUID?
    var uri: String?
    var count: Int?
    var createdAt: Date?
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, uri: String? = nil, count: Int? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.uri = uri
        self.count = count
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    init(entity: ReportEntity) {
        
        self.init(id: entity.id, uri: entity.uri, count: entity.count, createdAt: entity.createdAt, modifiedAt: entity.modifiedAt)
    }
}

