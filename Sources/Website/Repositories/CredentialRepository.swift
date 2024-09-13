import Fluent
import Foundation

final class CredentialRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching credential entity by the given identifier
    func find(id: UUID) async throws -> CredentialEntity? {
        
       return try await database.query(CredentialEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds the first matching credential entity by the given name
    func find(name: String) async throws -> CredentialEntity? {
        
        return try await database.query(CredentialEntity.self)
            .filter(\.$username == name)
            .first()
    }
    
    /// Inserts a new credential entity
    func insert(entity: CredentialEntity) async throws {
        
        try await database.query(CredentialEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$username, to: entity.username)
            .set(\.$password, to: entity.password)
            .set(\.$status, to: entity.status)
            .set(\.$attempt, to: entity.attempt)
            .create()
    }
    
    /// Updates a specific field of the credential entity
    func patch<Field: QueryableProperty>(field: KeyPath<CredentialEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == CredentialEntity {
        
        try await database.query(CredentialEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }

    /// Updates all fields of the credential entity.
    func update(entity: CredentialEntity, on id: UUID) async throws {
        
        try await database.query(CredentialEntity.self)
            .filter(\.$id == id)
            .set(\.$username, to: entity.username)
            .set(\.$password, to: entity.password)
            .set(\.$status, to: entity.status)
            .set(\.$attempt, to: entity.attempt)
            .update()
    }
}
