import HTMLKit
import HTMLKitComponents

struct UserList: View {
    
    var users: [UserModel.Output]
    
    var body: Content {
        Card {
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
                                user.role.capitalized
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
                                Text {
                                    "\u{2981}\u{2981}\u{2981}"
                                }
                            }
                            .frame(width: .two)
                            .borderShape(.smallrounded)
                        }
                    }
                    .padding(insets: .vertical, length: .small)
                }
            }
            .listStyle(.listgroup)
        }
        .borderShape(.smallrounded)
        .margin(insets: .bottom, length: .medium)
    }
}
