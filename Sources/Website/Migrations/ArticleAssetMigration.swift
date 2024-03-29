import Fluent

struct ArticleAssetMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        
        try await database.schema("article+asset")
            .id()
            .field("article_id", .uuid)
            .field("asset_id", .uuid)
            .create()
    }
    
    func revert(on database: Database) async throws {
        
        try await database.schema("article+asset")
            .delete()
    }
}
