import Fluent
import Foundation

final class CommentRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching contact entity by the given identifier
    func find(id: UUID) async throws -> CommentEntity? {
        
       return try await database.query(CommentEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds all contact entities
    func find() async throws -> [CommentEntity] {
        
        return try await database.query(CommentEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new contact entity
    func insert(entity: CommentEntity) async throws {

        try await database.query(CommentEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$name, to: entity.name)
            .set(\.$message, to: entity.message)
            .set(\.$status, to: entity.status)
            .set(\.$article.$id, to: entity.$article.id)
            .create()
    }
    
    /// Updates a specific field of the contact entity
    func patch<Field: QueryableProperty>(field: KeyPath<CommentEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == CommentEntity {
        
        try await database.query(CommentEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    /// Updates all fields of the contact entity.
    func update(entity: CommentEntity, on id: UUID) async throws {
        
        try await database.query(CommentEntity.self)
            .filter(\.$id == id)
            .set(\.$name, to: entity.name)
            .set(\.$message, to: entity.message)
            .set(\.$status, to: entity.status)
            .set(\.$reply, to: entity.reply)
            .update()
    }
    
    /// Deletes an contact entity.
    func delete(id: UUID) async throws {
        
        try await database.query(CommentEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all contact entities.
    func count() async throws -> Int {
        
        return try await database.query(CommentEntity.self)
            .count()
    }
}
