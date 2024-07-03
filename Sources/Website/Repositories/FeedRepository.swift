import Fluent
import Foundation

final class FeedRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> FeedEntity? {
       
        return try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    func find() async throws -> [FeedEntity] {
        
        return try await database.query(FeedEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func find(status: String) async throws -> [FeedEntity] {
        
        return try await database.query(FeedEntity.self)
            .filter(\.$status == status)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: FeedEntity) async throws {

        try await database.query(FeedEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$message, to: entity.message)
            .set(\.$tags, to: entity.tags)
            .set(\.$status, to: entity.status)
            .create()
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<FeedEntity, Field>, to value: Field.Value, on id: UUID) async throws where Field.Model == FeedEntity {
        
        try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
        
    func update(entity: FeedEntity, on id: UUID) async throws {
        
        try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .set(\.$message, to: entity.message)
            .set(\.$tags, to: entity.tags)
            .set(\.$status, to: entity.status)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await database.query(FeedEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await database.query(FeedEntity.self)
            .count()
    }
}
