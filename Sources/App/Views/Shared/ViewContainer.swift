import HTMLKit
import HTMLKitVaporProvider
import HTMLKitComponents

public struct ViewContainer: Page {
    
    public let content: AnyContent
    
    public init(@ContentBuilder<AnyContent> content: () -> AnyContent) {
        self.content = content()
    }

    public var body: AnyContent {
        PageContainer {
            Header {
                Stack(direction: .vertical) {
                    StackColumn(size: .twelve) {
                        Text(size: .medium) {
                            "mattesmohr"
                        }
                        StackColumn(size: .twelve) {
                                NavigationContainer(direction: .horizontal) {
                                    NavigationItem {
                                        NavigationLink(uri: "/home/index") {
                                            "Home"
                                        }
                                    }
                                    NavigationItem {
                                        Span {
                                            "Explore"
                                        }
                                        .class("js_nav_1")
                                    }
                                    NavigationItem {
                                        Span {
                                            "Read"
                                        }
                                        .class("js_nav_2")
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/connect/index") {
                                            "Connect"
                                        }
                                    }
                                }
                                Division {
                                    NavigationContainer(direction: .horizontal) {
                                        NavigationItem {
                                            Span {
                                                "Menu"
                                            }
                                            .class("js_nav_4")
                                        }
                                    }
                                }
                                .class("mobile")
                        }
                    }
                    Division {
                        Stack(direction: .horizontal) {
                            StackColumn(size: .six) {
                            }
                            StackColumn(size: .three) {
                                NavigationContainer(direction: .vertical) {
                                    NavigationItem {
                                        Text(size: .small) {
                                            "Code"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/solutions/index") {
                                            "Solutions"
                                        }
                                    }
                                }
                            }
                            StackColumn(size: .three) {
                                NavigationContainer(direction: .vertical) {
                                    NavigationItem {
                                        Text(size: .small) {
                                            "Company"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/company/index") {
                                            "Company"
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .id("nav1")
                    Division {
                        Stack(direction: .horizontal) {
                            StackColumn(size: .six) {
                            }
                            StackColumn(size: .three) {
                            }
                            StackColumn(size: .three) {
                                NavigationContainer(direction: .vertical) {
                                    NavigationItem {
                                        Text(size: .small) {
                                            "About"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/articles/index/") {
                                            "Articles"
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .id("nav2")
                    Division {
                        Stack(direction: .vertical) {
                            StackColumn(size: .twelve) {
                                NavigationContainer(direction: .vertical) {
                                    NavigationItem {
                                        Text(size: .small) {
                                            "Sites"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/home/index") {
                                            "Home"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/solutions/index") {
                                            "Solutions"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/company/index") {
                                            "Company"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/articles/index") {
                                            "Articles"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/connect/index") {
                                            "Connect"
                                        }
                                    }
                                }
                            }
                            StackColumn(size: .twelve) {
                                NavigationContainer(direction: .vertical) {
                                    NavigationItem {
                                        Text(size: .small) {
                                            "Legal"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/term/index") {
                                            "Terms of use"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/privacy/index")  {
                                            "Privacy policy"
                                        }
                                    }
                                    NavigationItem {
                                        NavigationLink(uri: "/impressum/index")  {
                                            "Impressum"
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .id("nav3")
                }
            }
            Main {
                content
            }
            Footer {
                Stack(direction: .horizontal) {
                    StackColumn(size: .three) {
                        NavigationContainer(direction: .vertical) {
                            NavigationItem {
                                Text(size: .small) {
                                    "Languages"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "#") {
                                    "German"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "#") {
                                    "English"
                                }
                            }
                        }
                    }
                    StackColumn(size: .three) {
                        NavigationContainer(direction: .vertical) {
                            NavigationItem {
                                Text(size: .small) {
                                    "Sitemap"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "/solutions/index") {
                                    "Explore solutions"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "/company/index") {
                                    "Read about company"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "/connect/index") {
                                    "Get in touch"
                                }
                            }
                        }
                    }
                    StackColumn(size: .three) {
                        NavigationContainer(direction: .vertical) {
                            NavigationItem {
                                Text(size: .small) {
                                    "Resources"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "/downloads/index") {
                                    "Downloads"
                                }
                            }
                        }
                    }
                }
                Stack(direction: .horizontal) {
                    StackColumn(size: .twelve) {
                        Paragraph {
                            "&copy; 2021"
                        }
                    }
                    StackColumn(size: .twelve) {
                        NavigationContainer(direction: .horizontal) {
                            NavigationItem {
                                NavigationLink(uri: "/settings/index") {
                                    "Settings"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "/conditions/index") {
                                    "Conditions"
                                }
                            }
                            NavigationItem {
                                NavigationLink(uri: "/impressum/index") {
                                    "Impressum"
                                }
                            }
                        }
                    }
                }
                Division {
                    Stack(direction: .horizontal) {
                        StackColumn(size: .twelve) {
                            Paragraph {
                                "&copy; 2021"
                            }
                        }
                    }
                }
                .class("mobile")
            }
        }
    }
}
