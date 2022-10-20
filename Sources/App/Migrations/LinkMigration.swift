import Fluent

struct LinkMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("links")
            .id()
            .field("title", .string, .required)
            .field("url", .string)
            .field("project_id", .uuid, .references("projects", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("links")
            .delete()
    }
}
