import Fluent
import Foundation

final class UserRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching user entity by the given identifier
    func find(id: UUID) async throws -> UserEntity? {
        
       return try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds the first matching user entity by the given name
    func find(name: String) async throws -> UserEntity? {
        
        return try await database.query(UserEntity.self)
            .filter(\.$email == name)
            .first()
    }
    
    /// Finds all user entities
    func find() async throws -> [UserEntity] {
        
        return try await database.query(UserEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new user entity
    func insert(entity: UserEntity) async throws {
        
        try await database.query(UserEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$email, to: entity.email)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$biography, to: entity.biography)
            .set(\.$role, to: entity.role)
            .create()
    }
    
    /// Updates a specific field of the user entity
    func patch<Field: QueryableProperty>(field: KeyPath<UserEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == UserEntity {
        
        try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates all fields of the user entity.
    func update(entity: UserEntity, on id: UUID) async throws {
        
        try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .set(\.$email, to: entity.email)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$biography, to: entity.biography)
            .set(\.$role, to: entity.role)
            .update()
    }
    
    /// Deletes an user entity.
    func delete(id: UUID) async throws {
        
        try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all user entities.
    func count() async throws -> Int {
        
        return try await database.query(UserEntity.self)
            .count()
    }
}
