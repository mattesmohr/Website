import Fluent

struct ProjectAssetMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("project+asset")
            .id()
            .field("project_id", .uuid)
            .field("asset_id", .uuid)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("project+asset")
            .delete()
    }
}
