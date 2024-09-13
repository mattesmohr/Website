import Fluent

struct UserMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("users")
            .id()
            .field("avatar_id", .uuid, .references("assets", "id"))
            .field("email", .string, .required).unique(on: "email")
            .field("first_name", .string)
            .field("last_name", .string)
            .field("biography", .string)
            .field("role", .string)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("users")
            .delete()
    }
}
