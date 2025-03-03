import HTMLKit

enum SettingAdminPageModel {
    
    struct CreateViewModel {
        
        let title = LocalizedStringKey("Settings")
    }
    
    struct EditViewModel {
        
        let title = LocalizedStringKey("Settings")
        let settings: SettingModel.Output
    }
}
