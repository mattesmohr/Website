import Vapor
import Fluent

final class UserRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) -> EventLoopFuture<UserEntity?> {
        
       return UserEntity.query(on: database)
        .with(\.$credential)
        .filter(\.$id == id)
        .first()
    }
    
    func find(name: String) -> EventLoopFuture<UserEntity?> {
        
        return UserEntity.query(on: database)
            .with(\.$credential)
            .filter(\.$email == name)
            .first()
    }
    
    func find() -> EventLoopFuture<[UserEntity]> {
        
        return UserEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) -> EventLoopFuture<[UserEntity]> {
        
        return UserEntity.query(on: database)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
    }
    
    func insert(entity: UserEntity) -> EventLoopFuture<Void> {
        
        return entity.create(on: database)
    }
    
    func patch<Field>(field: KeyPath<UserEntity, Field>, to value: Field.Value, for id: UUID) -> EventLoopFuture<Void> where Field: QueryableProperty, Field.Model == UserEntity {
        
        return UserEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: UserEntity, on id: UUID) -> EventLoopFuture<Void> {
        
        return UserEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$email, to: entity.email)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$description, to: entity.description)
            .update()
    }
    
    func delete(id: UUID) -> EventLoopFuture<Void> {
        
        return UserEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() -> EventLoopFuture<Int> {
        
        return UserEntity.query(on: database)
            .count()
    }
}
