import Fluent
import Foundation

struct PostRepository {
    
    /// The database the repository is working on
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching post entity by the given identifier
    func find(id: Int) async throws -> PostEntity? {
       
        return try await database.query(PostEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds all post entities
    func find() async throws -> [PostEntity] {
        
        return try await database.query(PostEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Finds post entities by their status
    func find(status: String) async throws -> [PostEntity] {
        
        return try await database.query(PostEntity.self)
            .filter(\.$status == status)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new post entity
    func insert(entity: PostEntity) async throws {

        try await database.query(PostEntity.self)
            .set(\.$message, to: entity.message)
            .set(\.$tags, to: entity.tags)
            .set(\.$status, to: entity.status)
            .create()
    }
    
    /// Updates a specific field of the post entity
    func patch<Field: QueryableProperty>(field: KeyPath<PostEntity, Field>, to value: Field.Value, on id: Int) async throws where Field.Model == PostEntity {
        
        try await database.query(PostEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates all fields of the post entity.
    func update(entity: PostEntity, on id: Int) async throws {
        
        try await database.query(PostEntity.self)
            .filter(\.$id == id)
            .set(\.$message, to: entity.message)
            .set(\.$tags, to: entity.tags)
            .set(\.$status, to: entity.status)
            .update()
    }
    
    /// Deletes an post entity.
    func delete(id: Int) async throws {
        
        try await database.query(PostEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all post entities.
    func count() async throws -> Int {
        
        return try await database.query(PostEntity.self)
            .count()
    }
}
