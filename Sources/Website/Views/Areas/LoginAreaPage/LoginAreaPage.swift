import HTMLKit
import HTMLKitComponents

enum LoginAreaPage {
    
    struct LoginView: View {
        
        let viewModel: LoginAreaPageModel.LoginViewModel

        var body: Content {
            AreaPageContainer {
                Main {
                    HStack(spacing: .around) {
                        VStack(spacing: .around) {
                            Card {
                                LoginAreaPage.LoginForm()
                            }
                            .borderShape(.smallrounded)
                            .frame(width: .twelve)
                        }
                        .frame(width: .three)
                    }
                }
            }
        }
    }
    
    struct RegisterView: View {
        
        let viewModel: LoginAreaPageModel.RegisterViewModel

        var body: Content {
            AreaPageContainer {
                Main {
                    HStack(spacing: .around) {
                        VStack(spacing: .small) {
                            Card {
                                LoginAreaPage.ResetForm()
                            }
                            .borderShape(.smallrounded)
                            .frame(width: .twelve)
                        }
                        .frame(width: .three)
                    }
                }
            }
        }
    }
    
    struct ResetView: View {
        
        let viewModel: LoginAreaPageModel.ResetViewModel

        var body: Content {
            AreaPageContainer {
                Main {
                    HStack(spacing: .around) {
                        VStack(spacing: .small) {
                            Card {
                                LoginAreaPage.ResetForm()
                            }
                            .borderShape(.smallrounded)
                            .frame(width: .twelve)
                        }
                        .frame(width: .three)
                    }
                }
            }
        }
    }
}

