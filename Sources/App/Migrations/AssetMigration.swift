import Fluent

struct AssetMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("assets")
            .id()
            .field("title", .string, .required)
            .field("fileName", .string, .required)
            .field("fileFullName", .string, .required)
            .field("filePath", .string, .required)
            .field("fileExtension", .string, .required)
            .field("fileSize", .double, .required)
            .field("created_at", .datetime)
            .field("modified_at", .datetime)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("assets")
            .delete()
    }
}
