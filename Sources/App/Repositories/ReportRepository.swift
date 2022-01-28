import Vapor
import Fluent

final class ReportRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) -> EventLoopFuture<ReportEntity?> {
        
       return ReportEntity.query(on: database)
            .filter(\.$id == id)
            .first()
    }
    
    func find(uri: String) -> EventLoopFuture<ReportEntity?> {
        
        return ReportEntity.query(on: database)
            .filter(\.$uri == uri)
            .first()
    }
    
    func find() -> EventLoopFuture<[ReportEntity]> {
        
        return ReportEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) -> EventLoopFuture<[ReportEntity]> {
        
        return ReportEntity.query(on: database)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
    }
    
    func insert(entity: ReportEntity) -> EventLoopFuture<Void> {
        
        return entity.create(on: database)
    }
    
    func patch<Field>(field: KeyPath<ReportEntity, Field>, to value: Field.Value, for id: UUID) -> EventLoopFuture<Void> where Field: QueryableProperty, Field.Model == ReportEntity {
        
        return ReportEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: ReportEntity, on id: UUID) -> EventLoopFuture<Void> {
        
        return ReportEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$uri, to: entity.uri)
            .set(\.$count, to: entity.count)
            .update()
    }
    
    func delete(id: UUID) -> EventLoopFuture<Void> {
        
        return ReportEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() -> EventLoopFuture<Int> {
        
        return ReportEntity.query(on: database)
            .count()
    }
}

