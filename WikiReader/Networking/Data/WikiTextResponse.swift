//
//  WikiTextResponse.swift
//  WikiReader
//
//  Created by Višeslav Šako on 27/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import Foundation

struct WikiTextResponse: Codable {
    let batchcomplete: String
    let query: Query
    let warnings: Warnings
}


struct Pages: Codable {
    let the27360234: The27360234
    
    enum CodingKeys: String, CodingKey {
        case the27360234 = "27360234"
    }
}

struct The27360234: Codable {
    let extract: String
    let ns, pageid: Int
    let title: String
}

struct Warnings: Codable {
    let extracts, main: Extracts
}

struct Extracts: Codable {
    let empty: String
    
    enum CodingKeys: String, CodingKey {
        case empty = "*"
    }
}

