import Vapor
import Fluent

final class ArticleRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) -> EventLoopFuture<ArticleEntity?> {
       
        return ArticleEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .filter(\.$id == id)
            .first()
    }
    
    func find() -> EventLoopFuture<[ArticleEntity]> {
        
        return ArticleEntity.query(on: database)
            .with(\.$author)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) -> EventLoopFuture<[ArticleEntity]> {
        
        return ArticleEntity.query(on: database)
            .with(\.$author)
            .paginate(PageRequest(page: index, per: items))
            .map {
                return $0.items
            }
    }
    
    func insert(entity: ArticleEntity) -> EventLoopFuture<Void> {
                
        return entity.create(on: database)
    }
    
    func patch<Field>(field: KeyPath<ArticleEntity, Field>, to value: Field.Value, on id: UUID) -> EventLoopFuture<Void> where Field: QueryableProperty, Field.Model == ArticleEntity {
        
        return ArticleEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: ArticleEntity, on id: UUID) -> EventLoopFuture<Void> {
        
        return ArticleEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .update()
    }
    
    func delete(id: UUID) -> EventLoopFuture<Void> {
        
        return ArticleEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() -> EventLoopFuture<Int> {
        
        return ArticleEntity.query(on: database)
            .count()
    }
}
