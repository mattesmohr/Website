import Fluent
import FluentSQL
import Foundation

final class ProjectRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> ProjectEntity? {
        
       return try await database.query(ProjectEntity.self)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$assets)
            .filter(\.$id == id)
            .first()
    }
    
    func find() async throws -> [ProjectEntity] {
        
        return try await database.query(ProjectEntity.self)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$assets)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func find(slug: String) async throws -> ProjectEntity? {
        
        return try await database.query(ProjectEntity.self)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$assets)
            .filter(\.$slug == slug)
            .first()
    }
    
    func find(status: String) async throws -> [ProjectEntity] {
        
        return try await database.query(ProjectEntity.self)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$assets)
            .filter(\.$status == status)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: ProjectEntity) async throws {
        
        try await database.query(ProjectEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$title, to: entity.title)
            .set(\.$excerpt, to: entity.excerpt)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .set(\.$status, to: entity.status)
            .set(\.$repository, to: entity.repository)
            .set(\.$documentation, to: entity.documentation)
            .create()
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<ProjectEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ProjectEntity {
        
        try await database.query(ProjectEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: ProjectEntity, on id: UUID) async throws {
        
        try await database.query(ProjectEntity.self)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$excerpt, to: entity.excerpt)
            .set(\.$content, to: entity.content)
            .set(\.$category, to: entity.category)
            .set(\.$status, to: entity.status)
            .set(\.$repository, to: entity.repository)
            .set(\.$documentation, to: entity.documentation)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await database.query(ProjectEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await database.query(ProjectEntity.self)
            .count()
    }
    
    func group(column: String) async throws -> [StatisticEntity] {

        if let database = database as? SQLDatabase {
            
            let query = database.select()
                .column(column, as: "name")
                .column(SQLAlias(SQLFunction("COUNT", args: SQLDistinct("title")), as:  SQLIdentifier("count")))
                .from(ProjectEntity.schema)
                .groupBy(column)
                .limit(5)
                .orderBy("count", .descending)
            
            return try await query.all(decoding: StatisticEntity.self)
        }
        
        return []
    }
}
