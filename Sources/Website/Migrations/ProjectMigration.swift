import Fluent

struct ProjectMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("projects")
            .id()
            .field("slug", .string, .required)
            .field("thumbnail_id", .uuid, .references("assets", "id"))
            .field("title", .string, .required)
            .field("excerpt", .string, .required)
            .field("content", .custom("text"), .required)
            .field("status", .string, .required)
            .field("repository", .string)
            .field("documentation", .string)
            .field("category", .string, .required)
            .field("author_id", .uuid, .required, .references("users", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("projects")
            .delete()
    }
}
