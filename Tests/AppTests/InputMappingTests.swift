@testable import App
import XCTVapor

final class InputMappingTests: XCTestCase {
    
    func testArticleMapping() throws {
        
        var input = ArticleModel.Input(title: "Title", content: "Content", category: "Category", status: "Status")
        input.publishedOn = .distantFuture
        input.authorId = .generateRandom()
        
        XCTAssertEqual(input.title, "Title")
        XCTAssertEqual(input.content, "Content")
        XCTAssertEqual(input.category, "Category")
        XCTAssertEqual(input.status, "Status")
        XCTAssertEqual(input.publishedOn, Date.distantFuture)
        
        let entity = ArticleEntity(input: input)
        
        XCTAssertEqual(entity.title, "Title")
        XCTAssertEqual(entity.content, "Content")
        XCTAssertEqual(entity.category, "Category")
        XCTAssertEqual(entity.status, "Status")
        XCTAssertEqual(entity.publishedOn, Date.distantFuture)
    }
    
    func testAssetMapping() throws {
        
        let input = AssetModel.Input(title: "Title")
        
        XCTAssertEqual(input.title, "Title")
        
        let entity = AssetEntity(input: input)
        
        XCTAssertEqual(entity.title, "Title")
    }
    
    func testCommentMapping() throws {
        
        let input = CommentModel.Input(name: "Name", content: "Content")
        
        XCTAssertEqual(input.name, "Name")
        XCTAssertEqual(input.content, "Content")
        
        let entity = CommentEntity(input: input)
        
        XCTAssertEqual(entity.name, "Name")
        XCTAssertEqual(entity.content, "Content")
    }
    
    func testContactMapping() throws {
        
        let input = ContactModel.Input(firstName: "Firstname", lastName: "Lastname", email: "Email", message: "Message")
        
        XCTAssertEqual(input.firstName, "Firstname")
        XCTAssertEqual(input.lastName, "Lastname")
        XCTAssertEqual(input.email, "Email")
        XCTAssertEqual(input.message, "Message")
        
        let entity = ContactEntity(input: input)
        
        XCTAssertEqual(entity.firstName, "Firstname")
        XCTAssertEqual(entity.lastName, "Lastname")
        XCTAssertEqual(entity.email, "Email")
        XCTAssertEqual(entity.message, "Message")
    }
    
    func testCredentialMapping() throws {
        
        let input = CredentialModel.Input(password: "Password", role: "Role", status: "Status")
        
        XCTAssertEqual(input.password, "Password")
        XCTAssertEqual(input.role, "Role")
        XCTAssertEqual(input.status, "Status")
        
        let entity = CredentialEntity(input: input)
        
        XCTAssertEqual(entity.password, "Password")
        XCTAssertEqual(entity.role, "Role")
        XCTAssertEqual(entity.status, "Status")
    }
    
    func testLinkMapping() throws {
        
        let input = LinkModel.Input(title: "Title", url: "Url")
        
        XCTAssertEqual(input.title, "Title")
        XCTAssertEqual(input.url, "Url")
        
        let entity = LinkEntity(input: input)
        
        XCTAssertEqual(entity.title, "Title")
        XCTAssertEqual(entity.url, "Url")
    }
    
    func testProjectMapping() throws {
        
        var input = ProjectModel.Input(title: "Title", content: "Content", category: "Category", status: "Status")
        input.publishedOn = .distantFuture
        input.authorId = .generateRandom()
        
        XCTAssertEqual(input.title, "Title")
        XCTAssertEqual(input.content, "Content")
        XCTAssertEqual(input.category, "Category")
        XCTAssertEqual(input.status, "Status")
        XCTAssertEqual(input.publishedOn, .distantFuture)
        
        
        let entity = ProjectEntity(input: input)
        
        XCTAssertEqual(entity.title, "Title")
        XCTAssertEqual(entity.content, "Content")
        XCTAssertEqual(entity.category, "Category")
        XCTAssertEqual(entity.status, "Status")
        XCTAssertEqual(entity.publishedOn, .distantFuture)
    }
    
    func testReportMapping() throws {
        
        let input = ReportModel.Input(uri: "Uri", count: 1)
        
        XCTAssertEqual(input.uri, "Uri")
        XCTAssertEqual(input.count, 1)
        
        let entity = ReportEntity(input: input)
        
        XCTAssertEqual(entity.uri, "Uri")
        XCTAssertEqual(entity.count, 1)
    }
    
    func testUserMapping() throws {
        
        let input = UserModel.Input(email: "Email")
        
        XCTAssertEqual(input.email, "Email")
        
        let entity = UserEntity(input: input)
        
        XCTAssertEqual(entity.email, "Email")
    }
}
