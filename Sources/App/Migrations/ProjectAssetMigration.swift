import Fluent

struct ProjectAssetMigration: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("project+asset")
            .id()
            .field("project_id", .uuid)
            .field("asset_id", .uuid)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("project+asset")
            .delete()
    }
}
