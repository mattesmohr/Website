import Vapor

struct ArticleModel: Content {
    
    var output: Output?
    var categories: [String]?
    var states: [String]?
    
    struct Input: Content, Validatable {
        
        var thumbnailId: String?
        var title: String?
        var excerpt: String?
        var content: String?
        var category: String?
        var status: String?
        var publishedOn: Date?
        var authorId: UUID?
        
        static func validations(_ validations: inout Validations) {
            validations.add("title", as: String.self, is: !.empty)
            validations.add("content", as: String.self, is: !.empty)
            validations.add("category", as: String.self, is: !.empty)
            validations.add("status", as: String.self, is: !.empty)
        }
    }
    
    struct Output: Content {
        
        var id: UUID?
        var thumbnail: AssetModel.Output?
        var title: String?
        var excerpt: String?
        var content: String?
        var category: String?
        var status: ArticleStatus?
        var publishedOn: Date?
        var assets: [AssetModel.Output]?
        var comments: [CommentModel.Output]?
        var author: UserModel.Output?
        var createdAt: Date?
        var modifiedAt: Date?
        
        init() {}
        
        init(id: UUID? = nil, thumbnail: AssetModel.Output? = nil, title: String? = nil, excerpt: String? = nil, content: String? = nil, category: String? = nil, status: ArticleStatus? = nil, publishedOn: Date? = nil, assets: [AssetModel.Output]? = nil, comments: [CommentModel.Output]? = nil, author: UserModel.Output? = nil, createdAt: Date? = nil, modifiedAt: Date? = nil) {
            
            self.id = id
            self.thumbnail = thumbnail
            self.title = title
            self.excerpt = excerpt
            self.content = content
            self.category = category
            self.status = status
            self.publishedOn = publishedOn
            self.assets = assets
            self.comments = comments
            self.author = author
            self.createdAt = createdAt
            self.modifiedAt = modifiedAt
        }
        
        init(entity: ArticleEntity) {
            
            self.init(id: entity.id, title: entity.title, excerpt: entity.excerpt, content: entity.content, category: entity.category, status: ArticleStatus(rawValue: entity.status), publishedOn: entity.publishedOn, author: UserModel.Output(entity: entity.author), createdAt: entity.createdAt, modifiedAt: entity.modifiedAt)
        
            if let thumbnail = entity.thumbnail {
                self.thumbnail = AssetModel.Output(entity: thumbnail)
            }
            
            self.comments = entity.comments
                .map { entity in
                    return CommentModel.Output(entity: entity)
                }
            
            self.assets = entity.assets
                .map { entity in
                    return AssetModel.Output(entity: entity)
                }
        }
    }
}
