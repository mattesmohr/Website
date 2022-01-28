enum CredentialRole: String, Codable {
    case administrator
    case moderator
    case customer
}

enum CredentialStatus: String, Codable {
    case deactivated
    case locked
    case new
    case unlocked
}

enum ArticleStatus: String, Codable {
    case published
    case draft
    case archived
}

enum SolutionStatus: String, Codable {
    case published
    case confidential
}
