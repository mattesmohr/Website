import Fluent
import Foundation

final class UserRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> UserEntity? {
        
       return try await UserEntity.query(on: database)
            .with(\.$credential)
            .filter(\.$id == id)
            .first()
    }
    
    func find(name: String) async throws -> UserEntity? {
        
        return try await UserEntity.query(on: database)
            .with(\.$credential)
            .filter(\.$email == name)
            .first()
    }
    
    func find() async throws -> [UserEntity] {
        
        return try await UserEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) async throws -> [UserEntity] {
        
        return try await UserEntity.query(on: database)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
            .get()
    }
    
    func insert(entity: UserEntity) async throws {
        try await entity.create(on: database)
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<UserEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == UserEntity {
        
        try await UserEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: UserEntity, on id: UUID) async throws {
        
        try await UserEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$email, to: entity.email)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$description, to: entity.description)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await UserEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await UserEntity.query(on: database)
            .count()
    }
}
