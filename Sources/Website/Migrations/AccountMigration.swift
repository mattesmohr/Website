import Fluent

struct AccountMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("accounts")
            .id()
            .field("password", .string, .required)
            .field("status", .string, .required)
            .field("attempt", .int, .required)
            .field("user_id", .uuid, .references("users", "id", onDelete: .cascade))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("accounts")
            .delete()
    }
}
