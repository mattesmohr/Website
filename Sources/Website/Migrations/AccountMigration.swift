import Fluent

struct AccountMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("accounts")
            .field("id", .int, .identifier(auto: true))
            .field("password", .string, .required)
            .field("status", .string, .required)
            .field("attempt", .int, .required)
            .field("user_id", .int, .references("users", "id", onDelete: .cascade))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("accounts")
            .delete()
    }
}
