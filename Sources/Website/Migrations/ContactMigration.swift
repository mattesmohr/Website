import Fluent

struct ContactMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("contacts")
            .id()
            .field("first_name", .string, .required)
            .field("last_name", .string, .required)
            .field("email", .string, .required)
            .field("message", .string, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("contacts")
            .delete()
    }
}
