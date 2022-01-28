import Vapor
import Fluent

final class CredentialRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) -> EventLoopFuture<CredentialEntity?> {
        
       return CredentialEntity.query(on: database)
        .with(\.$user)
        .filter(\.$id == id)
        .first()
    }
    
    func find() -> EventLoopFuture<[CredentialEntity]> {
        
        return CredentialEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: CredentialEntity) -> EventLoopFuture<Void> {
        
        return entity.create(on: database)
    }
    
    func insert(entity: CredentialEntity, with child: UserEntity) -> EventLoopFuture<Void> {
        
        return entity.create(on: database)
            .map { _ in
                
                _ = entity.$user.create(child, on: self.database)
            }
    }
    
    func patch<Field>(field: KeyPath<CredentialEntity, Field>, to value: Field.Value, for id: UUID) -> EventLoopFuture<Void> where Field: QueryableProperty, Field.Model == CredentialEntity {
        
        return CredentialEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: CredentialEntity, on id: UUID) -> EventLoopFuture<Void> {
        
        return CredentialEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$password, to: entity.password)
            .set(\.$role, to: entity.role)
            .set(\.$status, to: entity.status)
            .update()
    }
    
    func delete(id: UUID) -> EventLoopFuture<Void> {
        
        return CredentialEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() -> EventLoopFuture<Int> {
        
        return CredentialEntity.query(on: database)
            .count()
    }
}
