@testable import App
import XCTVapor
import XCTFluent

final class ReportRepositoryTests: XCTestCase {
    
    var database = ArrayTestDatabase()
    
    func testSingleFetch() async throws {
        
        let repository = ReportRepository(database: database.db)
        
        let entity = try await repository.find(uri: "test")
        
        XCTAssertNotNil(entity)
    }
    
    func testMultipleFetch() async throws {
        
        let repository = ReportRepository(database: database.db)
        
        let entities = try await repository.find()
        
        XCTAssertNotNil(entities)
    }
    
    override func setUp() {
    
        super.setUp()
        
        database.append([
            TestOutput(ReportEntity(uri: "https://docs.vapor.codes", count: 2)),
            TestOutput(ReportEntity(uri: "https://github.com/mattesmohr", count: 5))
        ])
    }
}
