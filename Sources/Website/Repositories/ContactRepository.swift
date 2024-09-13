import Fluent
import Foundation

final class ContactRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching contact entity by the given identifier
    func find(id: UUID) async throws -> ContactEntity? {
        
       return try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds all contact entities
    func find() async throws -> [ContactEntity] {
        
        return try await database.query(ContactEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new contact entity
    func insert(entity: ContactEntity) async throws {

        try await database.query(ContactEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$email, to: entity.email)
            .set(\.$message, to: entity.message)
            .create()
    }
    
    /// Updates a specific field of the contact entity
    func patch<Field: QueryableProperty>(field: KeyPath<ContactEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ContactEntity {
        
        try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    /// Updates all fields of the contact entity.
    func update(entity: ContactEntity, on id: UUID) async throws {
        
        try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$email, to: entity.email)
            .set(\.$message, to: entity.message)
            .update()
    }
    
    /// Deletes an contact entity.
    func delete(id: UUID) async throws {
        
        try await database.query(ContactEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all contact entities.
    func count() async throws -> Int {
        
        return try await database.query(ContactEntity.self)
            .count()
    }
}
