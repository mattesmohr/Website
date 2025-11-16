import Fluent
import Foundation

struct AssetRepository {
    
    /// The database the repository is working on
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching asset entity by the given identifier
    func find(id: Int) async throws -> AssetEntity? {
        
        return try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Finds all asset entities
    func find() async throws -> [AssetEntity] {
        
        return try await database.query(AssetEntity.self)
            .sort(\.$modifiedAt, .descending)
            .all()
    }
    
    /// Inserts a new asset entity
    func insert(entity: AssetEntity) async throws {

        try await database.query(AssetEntity.self)
            .set(\.$title, to: entity.title)
            .set(\.$alternateText, to: entity.alternateText)
            .set(\.$fileName, to: entity.fileName)
            .set(\.$fileFullName, to: entity.fileFullName)
            .set(\.$filePath, to: entity.filePath)
            .set(\.$fileExtension, to: entity.fileExtension)
            .set(\.$fileSize, to: entity.fileSize)
            .create()
    }
    
    /// Updates a specific field of the asset entity
    func patch<Field: QueryableProperty>(field: KeyPath<AssetEntity, Field>, to value: Field.Value, for id: Int) async throws where Field.Model == AssetEntity {
        
        try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }
    
    /// Updates all fields of the asset entity.
    func update(entity: AssetEntity, on id: Int) async throws {
        
        try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$alternateText, to: entity.alternateText)
            .update()
    }
    /// Deletes an asset entity.
    func delete(id: Int) async throws {
        
        try await database.query(AssetEntity.self)
            .filter(\.$id == id)
            .delete()
    }
    
    /// Counts all asset entities.
    func count() async throws -> Int {
        
        return try await database.query(AssetEntity.self)
            .count()
    }
}
