import Vapor
import Fluent

final class ProjectRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) -> EventLoopFuture<ProjectEntity?> {
        
       return ProjectEntity.query(on: database)
        .with(\.$thumbnail)
        .with(\.$author)
        .with(\.$links)
        .with(\.$assets)
        .filter(\.$id == id)
        .first()
    }
    
    func find() -> EventLoopFuture<[ProjectEntity]> {
        
        return ProjectEntity.query(on: database)
            .with(\.$author)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) -> EventLoopFuture<[ProjectEntity]> {
        
        return ProjectEntity.query(on: database)
            .with(\.$author)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
    }
    
    func insert(entity: ProjectEntity) -> EventLoopFuture<Void> {
        
        return entity.create(on: database)
    }
    
    func patch<Field>(field: KeyPath<ProjectEntity, Field>, to value: Field.Value, for id: UUID) -> EventLoopFuture<Void> where Field: QueryableProperty, Field.Model == ProjectEntity {
        
        return ProjectEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: ProjectEntity, on id: UUID) -> EventLoopFuture<Void> {
        
        return ProjectEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .update()
    }
    
    func delete(id: UUID) -> EventLoopFuture<Void> {
        
        return ProjectEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() -> EventLoopFuture<Int> {
        
        return ProjectEntity.query(on: database)
            .count()
    }
}
