import Fluent
import Foundation

final class ReportRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching report entity by the given identifier
    func find(id: UUID) async throws -> ReportEntity? {
        
       return try await database.query(ReportEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds the first matching report entity by the given uri
    func find(uri: String) async throws -> ReportEntity? {
        
        return try await database.query(ReportEntity.self)
            .filter(\.$uri == uri)
            .first()
    }
    
    /// Finds all report entities
    func find() async throws -> [ReportEntity] {
        
        return try await database.query(ReportEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new report entity
    func insert(entity: ReportEntity) async throws {
        
        try await database.query(ReportEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$uri, to: entity.uri)
            .set(\.$count, to: entity.count)
            .create()
    }
    
    /// Updates a specific field of the report entity
    func patch<Field: QueryableProperty>(field: KeyPath<ReportEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ReportEntity {
        
        try await database.query(ReportEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates all fields of the report entity.
    func update(entity: ReportEntity, on id: UUID) async throws {
        
        try await database.query(ReportEntity.self)
            .filter(\.$id == id)
            .set(\.$uri, to: entity.uri)
            .set(\.$count, to: entity.count)
            .update()
    }
    
    /// Deletes an report entity.
    func delete(id: UUID) async throws {
        
        try await database.query(ReportEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all report entities.
    func count() async throws -> Int {
        
        return try await database.query(ReportEntity.self)
            .count()
    }
}

