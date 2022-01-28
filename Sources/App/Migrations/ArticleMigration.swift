import Fluent

struct ArticleMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("articles")
            .id()
            .field("thumbnail_id", .uuid, .references("assets", "id"))
            .field("title", .string, .required)
            .field("excerpt", .string)
            .field("content", .string, .required)
            .field("category", .string, .required)
            .field("status", .string, .required)
            .field("published_on", .datetime)
            .field("author_id", .uuid, .required, .references("users", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("articles")
            .delete()
    }
}
