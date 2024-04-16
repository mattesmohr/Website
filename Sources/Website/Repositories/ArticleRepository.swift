import Fluent
import Foundation

final class ArticleRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> ArticleEntity? {
       
        return try await ArticleEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .filter(\.$id == id)
            .first()
    }
    
    func find(slug: String) async throws -> ArticleEntity? {
       
        return try await ArticleEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .filter(\.$slug == slug)
            .first()
    }
    
    func find() async throws -> [ArticleEntity] {
        
        return try await ArticleEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func find(status: String) async throws -> [ArticleEntity] {
        
        return try await ArticleEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .filter(\.$status == status)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: ArticleEntity) async throws {
        try await entity.create(on: database)
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<ArticleEntity, Field>, to value: Field.Value, on id: UUID) async throws where Field.Model == ArticleEntity {
        
        try await ArticleEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: ArticleEntity, on id: UUID) async throws {
        
        try await ArticleEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$excerpt, to: entity.excerpt)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .set(\.$status, to: entity.status)
            .set(\.$publishedOn, to: entity.publishedOn)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await ArticleEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await ArticleEntity.query(on: database)
            .count()
    }
}
