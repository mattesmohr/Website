import Fluent
import Foundation

final class SettingRepository {
    
    /// The database the repository is working on
    let database: Database
    
    /// Initialise the repository
    ///
    /// - Parameter database: The given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Find the first setting entity
    ///
    /// - Parameter id: The identifier to look for
    ///
    /// - Returns: The potential entity
    func find(id: UUID) async throws -> SettingEntity? {
        
        return try await database.query(SettingEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Find all setting entities
    ///
    /// - Returns: A set of entities
    func find() async throws -> SettingEntity? {
        
        return try await database.query(SettingEntity.self)
            .first()
    }
    
    /// Insert a new setting entity
    ///
    /// - Parameter entity: The entity to insert
    func insert(entity: SettingEntity) async throws {

        try await database.query(SettingEntity.self)
            .set(\.$id, to: UUID())
            .set(\.$title, to: entity.title)
            .set(\.$description, to: entity.description)
            .set(\.$email, to: entity.email)
            .set(\.$hostname, to: entity.hostname)
            .set(\.$port, to: entity.port)
            .set(\.$security, to: entity.security)
            .set(\.$username, to: entity.username)
            .set(\.$password, to: entity.password)
            .create()
    }
    
    /// Update all fields of the setting entity
    ///
    /// - Parameters:
    ///   - entity: The new entity
    ///   - id: The identifier to look for
    func update(entity: SettingEntity, on id: UUID) async throws {
        
        try await database.query(SettingEntity.self)
            .filter(\.$id == id)
            .set(\.$title, to: entity.title)
            .set(\.$description, to: entity.description)
            .set(\.$email, to: entity.email)
            .set(\.$hostname, to: entity.hostname)
            .set(\.$port, to: entity.port)
            .set(\.$security, to: entity.security)
            .set(\.$username, to: entity.username)
            .set(\.$password, to: entity.password)
            .update()
    }
    
    /// Delete the setting entity
    ///
    /// - Parameter id: The identifier to look for
    func delete(id: UUID) async throws {
        
        try await database.query(SettingEntity.self)
            .filter(\.$id == id)
            .delete()
    }
}

