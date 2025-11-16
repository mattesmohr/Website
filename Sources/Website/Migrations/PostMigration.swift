import Fluent

struct PostMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await  database.schema("posts")
            .field("id", .int, .identifier(auto: true))
            .field("thumbnail_id", .int, .references("assets", "id"))
            .field("message", .custom("text"), .required)
            .field("tags", .string)
            .field("status", .string, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("posts")
            .delete()
    }
}
