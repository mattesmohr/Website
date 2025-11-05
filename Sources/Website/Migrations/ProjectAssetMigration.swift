import Fluent

struct ProjectAssetMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("project+asset")
            .field("id", .int, .identifier(auto: true))
            .field("project_id", .int)
            .field("asset_id", .int)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("project+asset")
            .delete()
    }
}
