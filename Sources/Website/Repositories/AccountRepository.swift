import Fluent
import Foundation

final class AccountRepository {
    
    /// The database instance used by the repository for e. g. querying
    let database: Database
    
    /// Initializes the repository with the given database
    init(database: Database) {
        
        self.database = database
    }
    
    /// Finds the first matching account entity by the given identifier
    func find(id: Int) async throws -> AccountEntity? {
        
       return try await database.query(AccountEntity.self)
            .filter(\.$id == id)
            .first()
    }
    
    /// Inserts a new account entity
    func insert(entity: AccountEntity) async throws {
        
        try await database.query(AccountEntity.self)
            .set(\.$password, to: entity.password)
            .set(\.$status, to: entity.status)
            .set(\.$attempt, to: entity.attempt)
            .set(\.$user.$id, to: entity.$user.id)
            .create()
    }
    
    /// Updates a specific field of the account entity
    func patch<Field: QueryableProperty>(field: KeyPath<AccountEntity, Field>, to value: Field.Value, for id: Int) async throws where Field.Model == AccountEntity {
        
        try await database.query(AccountEntity.self)
            .filter(\.$id == id)
            .set(field, to: value)
            .update()
    }

    /// Updates all fields of the account entity.
    func update(entity: AccountEntity, on id: Int) async throws {
        
        try await database.query(AccountEntity.self)
            .filter(\.$id == id)
            .set(\.$password, to: entity.password)
            .set(\.$status, to: entity.status)
            .set(\.$attempt, to: entity.attempt)
            .update()
    }
}
