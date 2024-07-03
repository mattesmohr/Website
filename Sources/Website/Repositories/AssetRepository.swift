import Fluent
import Foundation

final class AssetRepository {
    
    let database: Database
    
    init(database: Database) {
        
        self.database = database
    }
    
    func find(id: UUID) async throws -> AssetEntity? {
        
        return try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    func find() async throws -> [AssetEntity] {
        
        return try await database.query(AssetEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    func insert(entity: AssetEntity) async throws {

        try await database.query(AssetEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$title, to: entity.title)
            .set(\.$fileName, to: entity.fileName)
            .set(\.$fileFullName, to: entity.fileFullName)
            .set(\.$filePath, to: entity.filePath)
            .set(\.$fileExtension, to: entity.fileExtension)
            .set(\.$fileSize, to: entity.fileSize)
            .create()
    }
    
    func patch<Field: QueryableProperty>(field: KeyPath<AssetEntity, Field>, to value: Field.Value, for id: UUID) async throws where Field.Model == AssetEntity {
        
        try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    func update(entity: AssetEntity, on id: UUID) async throws {
        
        try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$fileName, to: entity.fileName)
            .set(\.$fileFullName, to: entity.fileFullName)
            .set(\.$filePath, to: entity.filePath)
            .set(\.$fileExtension, to: entity.fileExtension)
            .set(\.$fileSize, to: entity.fileSize)
            .update()
    }
    
    func delete(id: UUID) async throws {
        
        try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    func count() async throws -> Int {
        
        return try await database.query(AssetEntity.self)
            .count()
    }
}
