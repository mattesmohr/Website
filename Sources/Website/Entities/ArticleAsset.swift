import Fluent
import Foundation

final class ArticleAsset: Model, @unchecked Sendable {
 
    static let schema = "article+asset"
    
    @ID(custom: "id")
    var id: Int?
    
    @Parent(key: "article_id")
    var article: ArticleEntity
    
    @Parent(key: "asset_id")
    var asset: AssetEntity
    
    init() {}
    
    init(id: Int? = nil, article: ArticleEntity, asset: AssetEntity) throws {
        
        self.id = id
        self.$article.id = try article.requireID()
        self.$asset.id = try asset.requireID()
    }
}
