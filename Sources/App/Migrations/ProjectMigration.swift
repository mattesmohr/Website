import Fluent

struct ProjectMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("projects")
            .id()
            .field("thumbnail_id", .uuid, .references("assets", "id"))
            .field("title", .string, .required)
            .field("content", .string, .required)
            .field("status", .string, .required)
            .field("published_on", .datetime)
            .field("category", .string, .required)
            .field("author_id", .uuid, .required, .references("users", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("projects")
            .delete()
    }
}
