//
//  RandomResponse.swift
//  WikiReader
//
//  Created by Višeslav Šako on 27/08/2018.
//  Copyright © 2018 viseslav. All rights reserved.
//

import Foundation

struct WikiResponse: Codable {
    let batchcomplete: String
    let wikiRandomResponseContinue: Continue?
    let query: Query
    
    enum CodingKeys: String, CodingKey {
        case batchcomplete
        case wikiRandomResponseContinue = "continue"
        case query
    }
}

struct Query: Codable {
    let pages: [String: Page]
}

struct Page: Codable {
    let ns, pageid: Int
    let title: String
    let extract: String?
}

struct Continue: Codable {
    let continueContinue, grncontinue: String
    
    enum CodingKeys: String, CodingKey {
        case continueContinue = "continue"
        case grncontinue
    }
}

