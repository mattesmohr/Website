import Fluent

struct CredentialMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("credentials")
            .id()
            .field("password", .string, .required)
            .field("role", .string, .required)
            .field("status", .string, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("credentials")
            .delete()
    }
}
