import Fluent

struct CredentialMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await  database.schema("credentials")
            .id()
            .field("username", .string, .required).unique(on: "username")
            .field("password", .string, .required)
            .field("status", .string, .required)
            .field("attempt", .int, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("credentials")
            .delete()
    }
}
