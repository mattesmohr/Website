import Vapor
import Fluent

/// A type that summarizes the access to every repository
struct UnitOfWork {
    
    /// The database to work on
    var database: Database
    
    /// Access to the article repository
    var article: ArticleRepository {
        return .init(database: database)
    }
    
    /// Access to the asset repository
    var asset: AssetRepository {
        return .init(database: database)
    }
    
    /// Access to the contact repository
    var comment: CommentRepository {
        return .init(database: database)
    }
    
    /// Access to the contact repository
    var contact: ContactRepository {
        return .init(database: database)
    }
    
    /// Access to the account repository
    var account: AccountRepository {
        return .init(database: database)
    }
    
    /// Access to the feed repository
    var feed: FeedRepository {
        return .init(database: database)
    }
    
    /// Access to the project repository
    var project: ProjectRepository {
        return .init(database: database)
    }
    
    /// Access to the user repository
    var user: UserRepository {
        return .init(database: database)
    }
    
    /// Access to the report repository
    var report: ReportRepository {
        return .init(database: database)
    }
    
    /// Access to the setting repository
    var setting: SettingRepository {
        return .init(database: database)
    }
    
    /// Creates the unit of work
    ///
    /// - Parameter database: The database to work on
    init(database: Database) {
        self.database = database
    }
}
