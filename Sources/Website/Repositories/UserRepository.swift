import Fluent
import Foundation

final class UserRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    /// Returns only the specific user.
    func find(id: UUID) async throws -> UserEntity? {
        
       return try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    func find(name: String) async throws -> UserEntity? {
        
        return try await database.query(UserEntity.self)
            .filter(\.$email == name)
            .first()
    }
    
    /// Returns all available users.
    func find() async throws -> [UserEntity] {
        
        return try await database.query(UserEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Creates a new user.
    func insert(entity: UserEntity) async throws {
        
        try await database.query(UserEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$email, to: entity.email)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$description, to: entity.description)
            .set(\.$role, to: entity.role)
            .create()
    }
    
    /// Updates only a specifc property of the user.
    func patch<Field: QueryableProperty>(field: KeyPath<UserEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == UserEntity {
        
        try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates the whole model of the user.
    func update(entity: UserEntity, on id: UUID) async throws {
        
        try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .set(\.$email, to: entity.email)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$description, to: entity.description)
            .set(\.$role, to: entity.role)
            .update()
    }
    
    /// Deletes the specific credential.
    func delete(id: UUID) async throws {
        
        try await database.query(UserEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Returns the count of credential.
    func count() async throws -> Int {
        
        return try await database.query(UserEntity.self)
            .count()
    }
}
