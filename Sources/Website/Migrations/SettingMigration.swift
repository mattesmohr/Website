import Fluent

struct SettingMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("settings")
            .id()
            .field("site_name", .string)
            .field("meta_description", .string)
            .field("site_email", .string)
            .field("smtp_hostname", .string)
            .field("smtp_port", .string)
            .field("smtp_security", .string)
            .field("smtp_username", .string)
            .field("smtp_password", .string)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("settings")
            .delete()
    }
}
