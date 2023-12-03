import Fluent

struct FeedMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await  database.schema("feeds")
            .id()
            .field("message", .string, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("feeds")
            .delete()
    }
}
