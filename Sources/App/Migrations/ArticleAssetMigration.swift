import Fluent

struct ArticleAssetMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("article+asset")
            .id()
            .field("article_id", .uuid)
            .field("asset_id", .uuid)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("article+asset")
            .delete()
    }
}
