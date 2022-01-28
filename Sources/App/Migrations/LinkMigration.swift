import Fluent

struct LinkMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("links")
            .id()
            .field("title", .string, .required)
            .field("url", .string)
            .field("project_id", .uuid, .references("projects", "id"))
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("links")
            .delete()
    }
}
