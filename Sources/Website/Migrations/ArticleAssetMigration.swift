import Fluent

struct ArticleAssetMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("article+asset")
            .field("id", .int, .identifier(auto: true))
            .field("article_id", .int)
            .field("asset_id", .int)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("article+asset")
            .delete()
    }
}
