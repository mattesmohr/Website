import Fluent

struct CredentialMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await  database.schema("credentials")
            .id()
            .field("password", .string, .required)
            .field("role", .string, .required)
            .field("status", .string, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("credentials")
            .delete()
    }
}
