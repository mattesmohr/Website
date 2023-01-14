import Fluent
import Foundation

final class ContactRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> ContactEntity? {
        
       return try await ContactEntity.query(on: database)
            .filter(\.$id == id)
            .first()
    }
    
    func find() async throws -> [ContactEntity] {
        
        return try await ContactEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) async throws -> [ContactEntity] {
        
        return try await ContactEntity.query(on: database)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
            .get()
    }
    
    func insert(entity: ContactEntity) async throws {
        try await entity.create(on: database)
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<ContactEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ContactEntity {
        
        try await ContactEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: ContactEntity, on id: UUID) async throws
    {
        try await ContactEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$email, to: entity.email)
            .set(\.$message, to: entity.message)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await ContactEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await ContactEntity.query(on: database)
            .count()
    }
}
