import Fluent
import Foundation

final class CredentialRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> CredentialEntity? {
        
       return try await database.query(CredentialEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    func find(name: String) async throws -> CredentialEntity? {
        
        return try await database.query(CredentialEntity.self)
            .filter(\.$username == name)
            .first()
    }
    
    func find() async throws -> [CredentialEntity] {
        
        return try await database.query(CredentialEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: CredentialEntity) async throws {
        
        try await database.query(CredentialEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$username, to: entity.username)
            .set(\.$password, to: entity.password)
            .set(\.$status, to: entity.status)
            .set(\.$attempt, to: entity.attempt)
            .create()
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<CredentialEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == CredentialEntity {
        
        try await database.query(CredentialEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }

    func update(entity: CredentialEntity, on id: UUID) async throws {
        
        try await database.query(CredentialEntity.self)
            .filter(\.$id == id)
            .set(\.$username, to: entity.username)
            .set(\.$password, to: entity.password)
            .set(\.$status, to: entity.status)
            .set(\.$attempt, to: entity.attempt)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await database.query(CredentialEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await database.query(CredentialEntity.self)
            .count()
    }
}
