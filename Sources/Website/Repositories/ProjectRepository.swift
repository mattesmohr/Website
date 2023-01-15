import Fluent
import Foundation

final class ProjectRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> ProjectEntity? {
        
       return try await ProjectEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$links)
            .with(\.$assets)
            .filter(\.$id == id)
            .first()
    }
    
    func find() async throws -> [ProjectEntity] {
        
        return try await ProjectEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$links)
            .with(\.$assets)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func page(index: Int, with items: Int) async throws -> [ProjectEntity] {
        
        return try await ProjectEntity.query(on: database)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$links)
            .with(\.$assets)
            .paginate(PageRequest(page: index, per: items))
            .map { page in
                return page.items
            }
            .get()
    }
    
    func insert(entity: ProjectEntity) async throws {
        try await entity.create(on: database)
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<ProjectEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ProjectEntity {
        
        try await ProjectEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: ProjectEntity, on id: UUID) async throws {
        
        try await ProjectEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .set(\.$status, to: entity.status)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await ProjectEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await ProjectEntity.query(on: database)
            .count()
    }
}
