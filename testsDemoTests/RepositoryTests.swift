//
//  RepositoryTests.swift
//  testsDemoTests
//
//  Created by Itsuki on 2023/10/17.
//

import XCTest
@testable import testsDemo

final class RepositoryTests: XCTestCase {
    
    var sut: Repository!

    override func setUpWithError() throws {
        
        try super.setUpWithError()

    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // 5
        // Object Cleanup
        sut = nil
    }

    func testRepositoryDecoding() throws {
        
        let path = Bundle(for: ResponseTest.self).path(forResource: "sampleRepository", ofType: "json")!
        let data = NSData(contentsOfFile: path)! as Data
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        sut = try! decoder.decode(Repository.self, from: data)
        XCTAssertEqual(sut.id, 44838949)
        XCTAssertEqual(sut.fullName, "apple/swift")
        XCTAssertEqual(sut.stargazersCount, 61951)
        XCTAssertEqual(sut.language, "C++")
        
    }
    

}
