import Fluent

struct ReportMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("reports")
            .field("id", .int, .identifier(auto: true))
            .field("uri", .string, .required)
            .field("count", .int, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("reports")
            .delete()
    }
}
