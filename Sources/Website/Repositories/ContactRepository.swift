import Fluent
import Foundation

final class ContactRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> ContactEntity? {
        
       return try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    func find() async throws -> [ContactEntity] {
        
        return try await database.query(ContactEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: ContactEntity) async throws {

        try await database.query(ContactEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$email, to: entity.email)
            .set(\.$message, to: entity.message)
            .create()
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<ContactEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ContactEntity {
        
        try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: ContactEntity, on id: UUID) async throws {
        
        try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$email, to: entity.email)
            .set(\.$message, to: entity.message)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await database.query(ContactEntity.self)
            .count()
    }
}
