import Vapor
import Fluent

final class AssetRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) -> EventLoopFuture<AssetEntity?> {
        
        return AssetEntity.query(on: database)
            .filter(\.$id == id)
            .first()
    }
    
    func find() -> EventLoopFuture<[AssetEntity]> {
        
        return AssetEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) -> EventLoopFuture<[AssetEntity]> {
        
        return AssetEntity.query(on: database)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
    }
    
    func insert(entity: AssetEntity) -> EventLoopFuture<Void> {
        
        return entity.create(on: database)
    }
    
    func patch<Field>(field: KeyPath<AssetEntity, Field>, to value: Field.Value, for id: UUID) -> EventLoopFuture<Void> where Field: QueryableProperty, Field.Model == AssetEntity {
        
        return AssetEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: AssetEntity, on id: UUID) -> EventLoopFuture<Void> {
        
        return AssetEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$fileName, to: entity.fileName)
            .set(\.$fileFullName, to: entity.fileFullName)
            .set(\.$filePath, to: entity.filePath)
            .set(\.$fileExtension, to: entity.fileExtension)
            .set(\.$fileSize, to: entity.fileSize)
            .update()
    }
    
    func delete(id: UUID) -> EventLoopFuture<Void> {
        
        return AssetEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() -> EventLoopFuture<Int> {
        
        return AssetEntity.query(on: database)
            .count()
    }
}
