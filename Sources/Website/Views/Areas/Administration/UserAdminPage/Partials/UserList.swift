import HTMLKit
import HTMLKitComponents

struct UserList: View {
    
    var users: [UserModel.Output]
    
    var body: Content {
        List(direction: .vertical) {
            for user in users {
                ListRow {
                    HStack {
                        Text {
                            user.email
                        }
                        .frame(width: .four)
                        Text {
                            user.firstName
                        }
                        .frame(width: .two)
                        Text {
                            user.lastName
                        }
                        .frame(width: .two)
                        Text {
                            user.modifiedAt.formatted(date: .short, time: .none)
                        }
                        .frame(width: .two)
                        Dropdown {
                            List(direction: .vertical) {
                                ListRow {
                                    Link(destination: "/area/admin/users/edit/\(user.id)") {
                                        Symbol(system: "folder")
                                        Text {
                                            "Edit"
                                        }
                                    }
                                }
                                Divider()
                                ListRow {
                                    Link(destination: "/area/admin/users/delete/\(user.id)") {
                                        Symbol(system: "folder")
                                        Text {
                                            "Delete"
                                        }
                                    }
                                }
                            }
                        } label: {
                            Symbol(system: "actions")
                        }
                        .frame(width: .two)
                        .borderShape(.smallrounded)
                    }
                }
            }
        }
        .listStyle(.listgroup)
        .frame(width: .twelve)
    }
}
