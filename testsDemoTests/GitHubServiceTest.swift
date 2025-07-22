// //
// //  GitHubServiceTest.swift
// //  testsDemoTests
// //
// //  Created by Itsuki on 2023/10/17.
// //

// import XCTest
// import OHHTTPStubs
// import OHHTTPStubsSwift
// @testable import testsDemo


// final class GitHubServiceTest: XCTestCase {

//     override func setUpWithError() throws {
//         super.setUp()

//     }

//     override func tearDownWithError() throws {
//         HTTPStubs.removeAllStubs()
//         super.tearDown()
//     }

//     func testGitHubRepositoryPublisherSuccess() async {
            
//         var repositoryList: [Repository] = []
//         var error: Error?
        
// //        let expectation = XCTestExpectation(description: "Fetching repositories. ")
//         stub(condition: isHost("api.github.com") && isPath("/search/repositories") ) { _ in
//             return HTTPStubsResponse(
//                 fileAtPath: OHPathForFile("sampleResponse.json", type(of: self))!,
//                 statusCode: 200,
//                 headers: ["Content-Type":"application/json"]
//             )
//         }
//         do {
//             repositoryList = try await GitHubService.fetchRepositories(query: "")
//         } catch(let e) {
//             error = e
//         }
        
// //        expectation.fulfill()
// //        await fulfillment(of:[expectation], timeout:10)
//         XCTAssertNil(error)
//         XCTAssertEqual(repositoryList.count, 30)
//         XCTAssertEqual(repositoryList.first?.id, 44838949)
//     }
    
    
//     func testGitHubRepositoryPublisherTimeOut() async {
            
//         var error: Error?
        
// //        let expectation = XCTestExpectation(description: "Fetching repositories. ")
//         stub(condition: isHost("api.github.com") && isPath("/search/repositories") ) { _ in
//             return HTTPStubsResponse(
//                 fileAtPath: OHPathForFile("sampleResponse.json", type(of: self))!,
//                 statusCode: 200,
//                 headers: ["Content-Type":"application/json"]
//             ).requestTime(360, responseTime: 360)
//         }
//         do {
//             let repositoryList = try await GitHubService.fetchRepositories(query: "")
//         } catch(let e) {
//             error = e
//         }
// //        expectation.fulfill()

// //        await fulfillment(of:[expectation], timeout:360)
//         XCTAssertNotNil(error)
//         XCTAssertEqual(error as! GitHubService.ServiceError, GitHubService.ServiceError.network)

//     }
    
    
//     func testGitHubRepositoryPublisherParsing() async {
            
//         var error: Error?
        
//         let expectation = XCTestExpectation(description: "Fetching repositories. ")
//         stub(condition: isHost("api.github.com") && isPath("/search/repositories") ) { _ in
//             return HTTPStubsResponse(
//                 fileAtPath: OHPathForFile("sampleResponseParsingError.json", type(of: self))!,
//                 statusCode: 200,
//                 headers: ["Content-Type":"application/json"]
//             )
//         }
//         do {
//             let repositoryList = try await GitHubService.fetchRepositories(query: "")
//         } catch(let e) {
//             error = e
//         }
//         expectation.fulfill()

//         await fulfillment(of:[expectation], timeout:360)
//         XCTAssertNotNil(error)
//         XCTAssertEqual(error as! GitHubService.ServiceError, GitHubService.ServiceError.parsing)

//     }

    

// }
