import Fluent
import Foundation

final class ReportEntity: Model, @unchecked Sendable {
    
    static let schema = "reports"
    
    @ID
    var id: UUID?
    
    @Field(key: "uri")
    var uri: String
    
    @Field(key: "count")
    var count: Int
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "modified_at", on: .update)
    var modifiedAt: Date?
    
    init() {}
    
    init(id: UUID? = nil, uri: String, count: Int, createdAt: Date? = nil, modifiedAt: Date? = nil) {
        
        self.id = id
        self.uri = uri
        self.count = count
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
    }
    
    convenience init(input: ReportModel.Input) {
        self.init(uri: input.uri, count: input.count!)
    }
}

