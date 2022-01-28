import Fluent

struct CommentMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("comments")
            .id()
            .field("avatar_id", .uuid, .references("assets", "id"))
            .field("name", .string, .required)
            .field("content", .string, .required)
            .field("article_id", .uuid, .references("articles", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("comments")
            .delete()
    }
}
