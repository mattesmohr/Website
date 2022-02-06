import Vapor

func routes(_ app: Application) throws {
    
    try app.register(collection: HomePageController())
    try app.register(collection: ArticlesPageController())
    try app.register(collection: ProjectsPageController())
    try app.register(collection: CompanyPageController())
    try app.register(collection: ConnectPageController())
    try app.register(collection: PrivacyPageController())
    try app.register(collection: SettingsPageController())
    try app.register(collection: ImpressumPageController())
    try app.register(collection: ConditionsPageController())
    
    try app.group("area", configure: { routes in
    
        try routes.register(collection: LoginAreaController())
        
        try routes.group("admin", configure: { routes in
            
            let group = routes.grouped(app.sessions.middleware,
                                       UserSessionAuthenticator(),
                                       UserModel.Output.redirectMiddleware(path: "/area/login/index"))
        
            try group.register(collection: HomeAdminController())
            try group.register(collection: ProjectAdminController())
            try group.register(collection: ArticleAdminController())
            try group.register(collection: AssetAdminController())
            try group.register(collection: UserAdminController())
            try group.register(collection: ReportAdminController())
        })
    })
}
