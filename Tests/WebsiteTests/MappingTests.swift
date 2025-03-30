@testable import Website
import XCTVapor

final class MappingTests: XCTestCase {
    
    func testUserMapping() throws {
        
        let input = UserModel.Input(
            email: "Email",
            firstName: "Firstname",
            lastName: "Lastname",
            biography: "Biography",
            role: "Role"
         )
        
        XCTAssertEqual(input.email, "Email")
        XCTAssertEqual(input.firstName, "Firstname")
        XCTAssertEqual(input.lastName, "Lastname")
        XCTAssertEqual(input.role, "Role")
        XCTAssertEqual(input.biography, "Biography")

        let entity = UserEntity(input: input)

        XCTAssertEqual(entity.email, "Email")
        XCTAssertEqual(entity.firstName, "Firstname")
        XCTAssertEqual(entity.lastName, "Lastname")
        XCTAssertEqual(entity.role, "Role")
        XCTAssertEqual(entity.biography, "Biography")
    }
    
    func testArticleMapping() {
        
        let input = ArticleModel.Input(
            title: "Title",
            excerpt: "Excerpt",
            content: "Content",
            category: "Category",
            status: "Status",
            comment: "Comment",
            authorId: .init()
        )
        
        XCTAssertEqual(input.title, "Title")
        XCTAssertEqual(input.excerpt, "Excerpt")
        XCTAssertEqual(input.content, "Content")
        XCTAssertEqual(input.category, "Category")
        XCTAssertEqual(input.status, "Status")
        XCTAssertEqual(input.comment, "Comment")
        
        let entity = ArticleEntity(input: input)
        
        XCTAssertEqual(entity.title, "Title")
        XCTAssertEqual(entity.excerpt, "Excerpt")
        XCTAssertEqual(entity.content, "Content")
        XCTAssertEqual(entity.category, "Category")
        XCTAssertEqual(entity.status, "Status")
        XCTAssertEqual(entity.comment, "Comment")
    }
    
    func testContactMapping() {
        
        let input = ContactModel.Input(
            firstName: "Firstname",
            lastName: "Lastname",
            email: "Email",
            message: "Message"
        )
        
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
    
    func testFeedMapping() {
        
        let input = FeedModel.Input(
            message: "Message",
            tags: "Tags",
            status: "Status"
        )
        
        XCTAssertEqual(input.message, "Message")
        XCTAssertEqual(input.tags, "Tags")
        XCTAssertEqual(input.status, "Status")
        
        let entity = FeedEntity(input: input)
        
        XCTAssertEqual(entity.message, "Message")
        XCTAssertEqual(entity.tags, "Tags")
        XCTAssertEqual(entity.status, "Status")
    }
    
    func testCommentMapping() {
        
        let input = CommentModel.Input.Private(
            message: "Message",
            reply: "Reply",
            status: "Status"
        )
        
        XCTAssertEqual(input.message, "Message")
        XCTAssertEqual(input.reply, "Reply")
        XCTAssertEqual(input.status, "Status")
    }
}
