import Fluent

struct AssetMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("assets")
            .id()
            .field("title", .string, .required)
            .field("alternate_text", .string)
            .field("file_name", .string, .required)
            .field("file_fullname", .string, .required)
            .field("file_path", .string, .required)
            .field("file_extension", .string, .required)
            .field("file_size", .double, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("assets")
            .delete()
    }
}
