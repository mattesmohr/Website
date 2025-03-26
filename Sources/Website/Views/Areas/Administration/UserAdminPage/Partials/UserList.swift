import HTMLKit
import HTMLKitComponents

struct UserList: View {
    
    let users: [UserModel.Output]
    
    var body: Content {
        Card {
            List(direction: .vertical) {
                for user in users {
                    HStack {
                        Text {
                            user.email
                        }
                        .frame(width: .four)
                        .lineLimit(.one)
                        Text {
                            user.firstName
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Text {
                            user.lastName
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Text(user.role.localizedDescription)
                            .frame(width: .two)
                            .lineLimit(.one)
                        Text {
                            user.modifiedAt.formatted(date: .short, time: .none)
                        }
                        .frame(width: .two)
                        .lineLimit(.one)
                        Dropdown {
                            List(direction: .vertical) {
                                Link(destination: "/area/admin/users/\(user.id)/edit") {
                                    Symbol(system: .pencil)
                                    Text("Edit")
                                }
                            }
                        } label: {
                            Symbol(system: .ellipsis(.horizontal))
                        }
                        .frame(width: .two)
                        .borderShape(.smallrounded)
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
