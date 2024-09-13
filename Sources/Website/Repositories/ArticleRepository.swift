import Fluent
import Foundation

final class ArticleRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching activity entity by the given identifier
    func find(id: UUID) async throws -> ArticleEntity? {
       
        return try await database.query(ArticleEntity.self)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds the first activity entity by its slug
    func find(slug: String) async throws -> ArticleEntity? {
       
        return try await database.query(ArticleEntity.self)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .filter(\.$slug == slug)
            .first()
    }
    
    /// Finds all article entities
    func find() async throws -> [ArticleEntity] {
        
        return try await database.query(ArticleEntity.self)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Finds article entities by their status
    func find(status: String) async throws -> [ArticleEntity] {
        
        return try await database.query(ArticleEntity.self)
            .with(\.$thumbnail)
            .with(\.$assets)
            .with(\.$author)
            .with(\.$comments)
            .filter(\.$status == status)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new article entity
    func insert(entity: ArticleEntity) async throws {
        
        try await database.query(ArticleEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$title, to: entity.title)
            .set(\.$excerpt, to: entity.excerpt)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .set(\.$status, to: entity.status)
            .set(\.$publishedOn, to: entity.publishedOn)
            .create()
    }
    
    /// Updates a specific field of the article entity
    func patch<Field: QueryableProperty>(field: KeyPath<ArticleEntity, Field>, to value: Field.Value, on id: UUID) async throws where Field.Model == ArticleEntity {
        
        try await database.query(ArticleEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates all fields of the article entity.
    func update(entity: ArticleEntity, on id: UUID) async throws {
        
        try await database.query(ArticleEntity.self)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$excerpt, to: entity.excerpt)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .set(\.$status, to: entity.status)
            .set(\.$publishedOn, to: entity.publishedOn)
            .update()
    }
    
    /// Deletes an article entity.
    func delete(id: UUID) async throws {
        
        try await database.query(ArticleEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all article entities.
    func count() async throws -> Int {
        
        return try await database.query(ArticleEntity.self)
            .count()
    }
}
