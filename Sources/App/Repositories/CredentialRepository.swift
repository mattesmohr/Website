import Fluent
import Foundation

final class CredentialRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> CredentialEntity? {
        
       return try await CredentialEntity.query(on: database)
            .with(\.$user)
            .filter(\.$id == id)
            .first()
    }
    
    func find() async throws -> [CredentialEntity] {
        
        return try await CredentialEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: CredentialEntity) async throws {
        try await entity.create(on: database)
    }
    
    func insert(entity: CredentialEntity, with child: UserEntity) async throws {
        
        try await entity.create(on: database)
        
        _ = try await entity.$user.create(child, on: self.database)
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<CredentialEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == CredentialEntity {
        
        try await CredentialEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: CredentialEntity, on id: UUID) async throws {
        
        try await CredentialEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$password, to: entity.password)
            .set(\.$role, to: entity.role)
            .set(\.$status, to: entity.status)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await CredentialEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await CredentialEntity.query(on: database)
            .count()
    }
}
