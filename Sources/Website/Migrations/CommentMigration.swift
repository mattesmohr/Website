import Fluent

struct CommentMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("comments")
            .id()
            .field("avatar_id", .uuid, .references("assets", "id"))
            .field("name", .string, .required)
            .field("message", .custom("text"), .required)
            .field("reply", .custom("text"))
            .field("status", .string)
            .field("article_id", .uuid, .references("articles", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("comments")
            .delete()
    }
}
