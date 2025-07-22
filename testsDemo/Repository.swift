//
//  Repository.swift
//  testsDemo
//
//  Created by Itsuki on 2023/10/17.
//

import Foundation

struct Repository: Codable {
    
    var id: Int
    var fullName: String?
    var language: String?
    var stargazersCount: Int?

}


struct RepositoryResponse: Codable {
    var totalCount: Int
    var items: [Repository]
}
