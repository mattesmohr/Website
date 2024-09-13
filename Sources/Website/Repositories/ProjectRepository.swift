import Fluent
import FluentSQL
import Foundation

final class ProjectRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching project entity by the given identifier
    func find(id: UUID) async throws -> ProjectEntity? {
        
       return try await database.query(ProjectEntity.self)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$assets)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds all project entities
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
    
    /// Finds project entities by their status
    func find(status: String) async throws -> [ProjectEntity] {
        
        return try await database.query(ProjectEntity.self)
            .with(\.$thumbnail)
            .with(\.$author)
            .with(\.$assets)
            .filter(\.$status == status)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new project entity
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
    
    /// Updates a specific field of the project entity
    func patch<Field: QueryableProperty>(field: KeyPath<ProjectEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ProjectEntity {
        
        try await database.query(ProjectEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates all fields of the project entity.
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
    
    /// Deletes an project entity.
    func delete(id: UUID) async throws {
        
        try await database.query(ProjectEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all project entities.
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
