import HTMLKit
import HTMLKitComponents

struct LoginAreaPage {
    
    var views: [View] = [LoginView(), RegisterView(), ResetView()]
    
    struct LoginView: View {

        @TemplateValue(EmptyContext.self)
        var context

        public var body: AnyContent {
            AreaPageContainer {
                HStack {
                    StackColumn(size: .five) {
                        HTMLKitComponents.Form {
                            HStack {
                                StackColumn(size: .twelve, alignment: .center) {
                                    Text {
                                        "mattesmohr"
                                    }
                                    .fontSize(.large)
                                    .bold()
                                    Text {
                                        "Welcome"
                                    }
                                    .fontSize(.medium)
                                    .foregroundColor(.gray)
                                }
                            }
                            HStack {
                                StackColumn(size: .twelve) {
                                    FieldLabel(for: "email") {
                                        "Email"
                                    }
                                    TextField(name: "email")
                                }
                            }
                            HStack {
                                StackColumn(size: .twelve) {
                                    FieldLabel(for: "password") {
                                        "Password"
                                    }
                                    SecureField(name: "password")
                                }
                            }
                            HStack {
                                StackColumn(size: .twelve) {
                                    SubmitButton {
                                        "Sign in"
                                    }
                                    .buttonStyle(.primary)
                                    .borderShape(.smallrounded)
                                    .buttonSize(.full)
                                }
                            }
                            HStack {
                                StackColumn(size: .six) {
                                    ActionButton(destination: "/area/login/register") {
                                        "Sign up"
                                    }
                                    .buttonSize(.full)
                                    .buttonStyle(.secondary)
                                    .borderShape(.smallrounded)
                                }
                                StackColumn(size: .six) {
                                    ActionButton(destination: "/area/login/reset") {
                                        "Reset password"
                                    }
                                    .buttonSize(.full)
                                    .buttonStyle(.secondary)
                                    .borderShape(.smallrounded)
                                }
                            }
                        }
                    }
                }
                .contentSpace(.around)
            }
        }
    }
    
    struct RegisterView: View {

        @TemplateValue(CreateContext.self)
        var context

        public var body: AnyContent {
            AreaPageContainer {
                HStack {
                    StackColumn(size: .five) {
                        HTMLKitComponents.Form {
                            HStack {
                                StackColumn(size: .twelve, alignment: .center) {
                                    Text {
                                        "mattesmohr"
                                    }
                                    .fontSize(.large)
                                    .bold()
                                    Text {
                                        "Welcome"
                                    }
                                    .fontSize(.medium)
                                    .foregroundColor(.gray)
                                }
                            }
                            HStack {
                                StackColumn(size: .twelve) {
                                    FieldLabel(for: "email") {
                                        "Email"
                                    }
                                    TextField(name: "email")
                                }
                            }
                            HStack {
                                StackColumn(size: .twelve) {
                                    FieldLabel(for: "password") {
                                        "Password"
                                    }
                                    SecureField(name: "password")
                                }
                            }
                            HStack {
                                StackColumn(size: .twelve) {
                                    FieldLabel(for: "confirmation") {
                                        "Confirmation"
                                    }
                                    SecureField(name: "confirmation")
                                }
                            }
                            HStack {
                                StackColumn(size: .two) {
                                    ActionButton(destination: "/area/login/login") {
                                    }
                                    .buttonSize(.full)
                                    .buttonStyle(.secondary)
                                    .borderShape(.smallrounded)
                                }
                                StackColumn(size: .ten) {
                                    SubmitButton {
                                        "Submit"
                                    }
                                    .buttonSize(.full)
                                    .buttonStyle(.primary)
                                    .borderShape(.smallrounded)
                                }
                            }
                        }
                    }
                }
                .contentSpace(.around)
            }
        }
    }
    
    struct ResetView: View {

        @TemplateValue(CreateContext.self)
        var context

        public var body: AnyContent {
            AreaPageContainer {
                HStack {
                    StackColumn(size: .five) {
                        HTMLKitComponents.Form {
                            HStack {
                                StackColumn(size: .twelve, alignment: .center) {
                                    Text {
                                        "mattesmohr"
                                    }
                                    .fontSize(.large)
                                    .bold()
                                    Text {
                                        "Welcome"
                                    }
                                    .fontSize(.medium)
                                    .foregroundColor(.gray)
                                }
                            }
                            HStack {
                                StackColumn(size: .twelve) {
                                    FieldLabel(for: "email") {
                                        "Email"
                                    }
                                    TextField(name: "email")
                                }
                            }
                            HStack {
                                StackColumn(size: .two) {
                                    ActionButton(destination: "/area/login/login") {
                                    }
                                    .buttonSize(.full)
                                    .buttonStyle(.secondary)
                                    .borderShape(.smallrounded)
                                }
                                StackColumn(size: .ten) {
                                    SubmitButton {
                                        "Submit"
                                    }
                                    .buttonSize(.full)
                                    .buttonStyle(.primary)
                                    .borderShape(.smallrounded)
                                }
                            }
                        }
                    }
                }
                .contentSpace(.around)
            }
        }
    }
}

