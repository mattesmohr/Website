import Fluent
import Foundation

final class FeedRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching feed entity by the given identifier
    func find(id: UUID) async throws -> FeedEntity? {
       
        return try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds all feed entities
    func find() async throws -> [FeedEntity] {
        
        return try await database.query(FeedEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Finds feed entities by their status
    func find(status: String) async throws -> [FeedEntity] {
        
        return try await database.query(FeedEntity.self)
            .filter(\.$status == status)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new feed entity
    func insert(entity: FeedEntity) async throws {

        try await database.query(FeedEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$message, to: entity.message)
            .set(\.$tags, to: entity.tags)
            .set(\.$status, to: entity.status)
            .create()
    }
    
    /// Updates a specific field of the feed entity
    func patch<Field: QueryableProperty>(field: KeyPath<FeedEntity, Field>, to value: Field.Value, on id: UUID) async throws where Field.Model == FeedEntity {
        
        try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates all fields of the feed entity.
    func update(entity: FeedEntity, on id: UUID) async throws {
        
        try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .set(\.$message, to: entity.message)
            .set(\.$tags, to: entity.tags)
            .set(\.$status, to: entity.status)
            .update()
    }
    
    /// Deletes an feed entity.
    func delete(id: UUID) async throws {
        
        try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all feed entities.
    func count() async throws -> Int {
        
        return try await database.query(FeedEntity.self)
            .count()
    }
}
