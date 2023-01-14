import Fluent

struct ReportMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("reports")
            .id()
            .field("uri", .string, .required)
            .field("count", .string, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("reports")
            .delete()
    }
}
