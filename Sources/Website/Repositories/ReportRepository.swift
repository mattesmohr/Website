import Fluent
import Foundation

final class ReportRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> ReportEntity? {
        
       return try await ReportEntity.query(on: database)
            .filter(\.$id == id)
            .first()
    }
    
    func find(uri: String) async throws -> ReportEntity? {
        
        return try await ReportEntity.query(on: database)
            .filter(\.$uri == uri)
            .first()
    }
    
    func find() async throws -> [ReportEntity] {
        
        return try await ReportEntity.query(on: database)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: ReportEntity) async throws {
        try await entity.create(on: database)
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<ReportEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == ReportEntity {
        
        try await ReportEntity.query(on: database)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: ReportEntity, on id: UUID) async throws {
        
        try await ReportEntity.query(on: database)
            .filter(\.$id == id)
            .set(\.$uri, to: entity.uri)
            .set(\.$count, to: entity.count)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await ReportEntity.query(on: database)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await ReportEntity.query(on: database)
            .count()
    }
}

