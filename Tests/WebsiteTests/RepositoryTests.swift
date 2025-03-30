@testable import Website
import XCTVapor
import XCTFluent

final class RepositoryTests: XCTestCase {
    
    var application: Application!
    
    override func setUp() async throws {
        self.application = try await Application.make(.testing)
    }
   
    override func tearDown() async throws {
        
        try await self.application.asyncShutdown()
        
        self.application = nil
    }
    
    func testContactRepository() async throws {
        
        let database = ArrayTestDatabase()
        
        self.application.databases.use(database.configuration, as: .mysql)
        
        let id = UUID()
        
        database.append([
            TestOutput(ContactEntity(
                id: id,
                firstName: "Firstnaem",
                lastName: "Lastname",
                email: "Email",
                message: "Message",
                createdAt: .now, 
                modifiedAt: .now)
            ),
        ])
        
        self.application.get("users") { request -> [ContactModel.Output] in
            
            let results = try await ContactRepository(database: request.db)
                .find()
                .map(ContactModel.Output.init)
            
            return results
        }
        
        let output: [ContactModel.Output] = [
            ContactModel.Output(
                id: id,
                firstName: "Firstname",
                lastName: "Lastname",
                email: "Email",
                message: "Message",
                createdAt: .now,
                modifiedAt: .now
            )
        ]
        
        try await self.application.testable().test(.GET, "users") { response async in
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let result = try? decoder.decode([ContactModel.Output].self, from: response.body)
            
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(result, output)
        }
    }
}
