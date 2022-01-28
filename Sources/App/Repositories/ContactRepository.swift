import Vapor
import Fluent

final class ContactRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) -> EventLoopFuture<ContactEntity?> {
        
       return ContactEntity.query(on: database)
            .filter(\.$id == id)
            .first()
    }
    
    func find() -> EventLoopFuture<[ContactEntity]> {
        
        return ContactEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) -> EventLoopFuture<[ContactEntity]> {
        
        return ContactEntity.query(on: database)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
    }
    
    func insert(entity: ContactEntity) -> EventLoopFuture<Void> {
                
        return entity.create(on: database)
    }
    
    func patch<Field>(field: KeyPath<ContactEntity, Field>, to value: Field.Value, for id: UUID) -> EventLoopFuture<Void> where Field: QueryableProperty, Field.Model == ContactEntity {
        
        return ContactEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: ContactEntity, on id: UUID) -> EventLoopFuture<Void>
    {
        return ContactEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$firstName, to: entity.firstName)
            .set(\.$lastName, to: entity.lastName)
            .set(\.$email, to: entity.email)
            .set(\.$message, to: entity.message)
            .update()
    }
    
    func delete(id: UUID) -> EventLoopFuture<Void> {
        
        return ContactEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() -> EventLoopFuture<Int> {
        
        return ContactEntity.query(on: database)
            .count()
    }
}
