import HTMLKit
import HTMLKitComponents

struct ViewContainer: View {
    
    let content: [Content]
    
    init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    @EnvironmentObject(UserModel.Output.self)
    var identity

    var body: Content {
        PageContainer {
            Environment.unwrap(identity.fullname) { fullname in
                Aside {
                    HStack(spacing: .between) {
                        Link(destination: "/area/admin/home") {
                            Text("Back to the backend")
                                .fontSize(.small)
                        }
                        Link(destination: "/area/login/logout") {
                            Text("Log out")
                                .fontSize(.small)
                        }
                    }
                    .padding()
                }
            }
            Header {
                HStack(spacing: .between) {
                    Link(destination: "/home") {
                        Text {
                            "mattesmohr"
                        }
                        .fontSize(.medium)
                        .foregroundColor(.black)
                    }
                    .frame(width: .minimum)
                    Navigation {
                        Division {
                            Button(role: .button) {
                                Vector {
                                    Path {
                                        Title {
                                            "Navigation trigger"
                                        }
                                    }
                                    .draw("M3,1.75C3,1.336 3.336,1 3.75,1L16.25,1C16.664,1 17,1.336 17,1.75C17,2.164 16.664,2.5 16.25,2.5L3.75,2.5C3.336,2.5 3,2.164 3,1.75ZM5,5.75C5,5.336 5.336,5 5.75,5L16.25,5C16.664,5 17,5.336 17,5.75C17,6.164 16.664,6.5 16.25,6.5L5.75,6.5C5.336,6.5 5,6.164 5,5.75ZM3,10.25C3,9.836 3.336,9.5 3.75,9.5L16.25,9.5C16.664,9.5 17,9.836 17,10.25C17,10.664 16.664,11 16.25,11L3.75,11C3.336,11 3,10.664 3,10.25ZM7,14.25C7,13.836 7.336,13.5 7.75,13.5L16.25,13.5C16.664,13.5 17,13.836 17,14.25C17,14.664 16.664,15 16.25,15L7.75,15C7.336,15 7,14.664 7,14.25Z")
                                }
                                .namespace("http://www. w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                        }
                        .class("navigation-trigger")
                        Division {
                            List(direction: .horizontal) {
                                Link(destination: "/home/#about") {
                                    Text("About")
                                }
                                Link(destination: "/projects") {
                                    Text("Projects")
                                }
                                Link(destination: "/feed") {
                                    Text("Feed")
                                }
                                Link(destination: "/articles") {
                                    Text("Blog")
                                }
                            }
                            .listSpacing(.large)
                            List(direction: .horizontal) {
                                Link(destination: "https://github.com/mattesmohr", target: .blank) {
                                    Vector {
                                        Path {
                                            Title {
                                                "Github"
                                            }
                                        }
                                        .draw("M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z")
                                    }
                                    .namespace("http://www.w3.org/2000/svg")
                                    .width(16)
                                    .height(16)
                                    .viewBox("0 0 16 16")
                                }
                                Link(destination: "https://iosdev.space/@mattesmohr", target: .blank) {
                                    Vector {
                                        Path {
                                            Title {
                                                "Mastadon"
                                            }
                                        }
                                        .draw("M11.19 12.195c2.016-.24 3.77-1.475 3.99-2.603.348-1.778.32-4.339.32-4.339 0-3.47-2.286-4.488-2.286-4.488C12.062.238 10.083.017 8.027 0h-.05C5.92.017 3.942.238 2.79.765c0 0-2.285 1.017-2.285 4.488l-.002.662c-.004.64-.007 1.35.011 2.091.083 3.394.626 6.74 3.78 7.57 1.454.383 2.703.463 3.709.408 1.823-.1 2.847-.647 2.847-.647l-.06-1.317s-1.303.41-2.767.36c-1.45-.05-2.98-.156-3.215-1.928a3.614 3.614 0 0 1-.033-.496s1.424.346 3.228.428c1.103.05 2.137-.064 3.188-.189zm1.613-2.47H11.13v-4.08c0-.859-.364-1.295-1.091-1.295-.804 0-1.207.517-1.207 1.541v2.233H7.168V5.89c0-1.024-.403-1.541-1.207-1.541-.727 0-1.091.436-1.091 1.296v4.079H3.197V5.522c0-.859.22-1.541.66-2.046.456-.505 1.052-.764 1.793-.764.856 0 1.504.328 1.933.983L8 4.39l.417-.695c.429-.655 1.077-.983 1.934-.983.74 0 1.336.259 1.791.764.442.505.661 1.187.661 2.046v4.203z")
                                    }
                                    .namespace("http://www.w3.org/2000/svg")
                                    .width(16)
                                    .height(16)
                                    .viewBox("0 0 16 16")
                                }
                                Link(destination: "https://www.linkedin.com/mattesmohr", target: .blank) {
                                    Vector {
                                        Path {
                                            Title {
                                                "LinkedIn"
                                            }
                                        }
                                        .draw("M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401m-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4")
                                    }
                                    .namespace("http://www.w3.org/2000/svg")
                                    .width(16)
                                    .height(16)
                                    .viewBox("0 0 16 16")
                                }
                            }
                            .listSpacing(.large)
                        }
                        .class("navigation-desktop")
                        Division {
                            VStack(alignment: .center, spacing: .large) {
                                List(direction: .vertical) {
                                    Link(destination: "/home/#about") {
                                        Text("About", alignment: .center)
                                            .fontSize(.large)
                                    }
                                    Link(destination: "/projects") {
                                        Text("Projects", alignment: .center)
                                            .fontSize(.large)
                                    }
                                    Link(destination: "/feed") {
                                        Text("Feed", alignment: .center)
                                            .fontSize(.large)
                                    }
                                    Link(destination: "/articles") {
                                        Text("Blog", alignment: .center)
                                            .fontSize(.large)
                                    }
                                }
                                .listSpacing(.large)
                                List(direction: .horizontal) {
                                    Link(destination: "https://github.com/mattesmohr", target: .blank) {
                                        Vector {
                                            Path {
                                                Title {
                                                    "Github"
                                                }
                                            }
                                            .draw("M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z")
                                        }
                                        .namespace("http://www.w3.org/2000/svg")
                                        .width(16)
                                        .height(16)
                                        .viewBox("0 0 16 16")
                                    }
                                    Link(destination: "https://iosdev.space/@mattesmohr", target: .blank) {
                                        Vector {
                                            Path {
                                                Title {
                                                    "Mastadon"
                                                }
                                            }
                                            .draw("M11.19 12.195c2.016-.24 3.77-1.475 3.99-2.603.348-1.778.32-4.339.32-4.339 0-3.47-2.286-4.488-2.286-4.488C12.062.238 10.083.017 8.027 0h-.05C5.92.017 3.942.238 2.79.765c0 0-2.285 1.017-2.285 4.488l-.002.662c-.004.64-.007 1.35.011 2.091.083 3.394.626 6.74 3.78 7.57 1.454.383 2.703.463 3.709.408 1.823-.1 2.847-.647 2.847-.647l-.06-1.317s-1.303.41-2.767.36c-1.45-.05-2.98-.156-3.215-1.928a3.614 3.614 0 0 1-.033-.496s1.424.346 3.228.428c1.103.05 2.137-.064 3.188-.189zm1.613-2.47H11.13v-4.08c0-.859-.364-1.295-1.091-1.295-.804 0-1.207.517-1.207 1.541v2.233H7.168V5.89c0-1.024-.403-1.541-1.207-1.541-.727 0-1.091.436-1.091 1.296v4.079H3.197V5.522c0-.859.22-1.541.66-2.046.456-.505 1.052-.764 1.793-.764.856 0 1.504.328 1.933.983L8 4.39l.417-.695c.429-.655 1.077-.983 1.934-.983.74 0 1.336.259 1.791.764.442.505.661 1.187.661 2.046v4.203z")
                                        }
                                        .namespace("http://www.w3.org/2000/svg")
                                        .width(16)
                                        .height(16)
                                        .viewBox("0 0 16 16")
                                    }
                                    Link(destination: "https://www.linkedin.com/mattesmohr", target: .blank) {
                                        Vector {
                                            Path {
                                                Title {
                                                    "LinkedIn"
                                                }
                                            }
                                            .draw("M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401m-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4")
                                        }
                                        .namespace("http://www.w3.org/2000/svg")
                                        .width(16)
                                        .height(16)
                                        .viewBox("0 0 16 16")
                                    }
                                }
                                .listSpacing(.large)
                                List(direction: .horizontal) {
                                    Link(destination: "/privacy") {
                                        Text("Privacy")
                                    }
                                    Link(destination: "/legal") {
                                        Text("Legal")
                                    }
                                }
                                .listSpacing(.large)
                            }
                        }
                        .class("navigation-mobile")
                    }
                }
                .padding(insets: .horizontal, length: .medium)
                .padding(insets: .vertical, length: .large)
            }
            .id("#top")
            Main {
                VStack(spacing: .large) {
                    content
                }
                .padding(insets: .horizontal, length: .medium)
                .padding(insets: .vertical, length: .large)
            }
            Footer {
                HStack(spacing: .between) {
                    Link(destination: "#top") {
                        Text("Back to top")
                    }
                    List(direction: .horizontal) {
                        Link(destination: "/legal") {
                            Text("Legal")
                        }
                        Link(destination: "/privacy") {
                            Text("Privacy")
                        }
                    }
                    .listSpacing(.small)
                }
                .padding(insets: .horizontal, length: .medium)
                .padding(insets: .vertical, length: .large)
            }
        }
    }
}
