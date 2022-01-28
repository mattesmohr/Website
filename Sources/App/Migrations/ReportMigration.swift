import Fluent

struct ReportMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("reports")
            .id()
            .field("uri", .string, .required)
            .field("count", .string, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("reports")
            .delete()
    }
}
