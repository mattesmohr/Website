import Fluent

struct ArticleMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("articles")
            .id()
            .field("thumbnail_id", .uuid, .references("assets", "id"))
            .field("title", .string, .required)
            .field("excerpt", .custom("text"))
            .field("content", .custom("text"), .required)
            .field("category", .string, .required)
            .field("status", .string, .required)
            .field("published_on", .datetime)
            .field("author_id", .uuid, .required, .references("users", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("articles")
            .delete()
    }
}
