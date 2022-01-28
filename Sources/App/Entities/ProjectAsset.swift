import Vapor
import Fluent

final class ProjectAsset: Model {
 
    static let schema = "project+asset"
    
    @ID(key: "id")
    var id: UUID?
    
    @Parent(key: "project_id")
    var project: ProjectEntity
    
    @Parent(key: "asset_id")
    var asset: AssetEntity
    
    init() {}
    
    init(id: UUID? = nil, project: ProjectEntity, asset: AssetEntity) throws {
        
        self.id = id
        self.$project.id = try project.requireID()
        self.$asset.id = try asset.requireID()
    }
}
