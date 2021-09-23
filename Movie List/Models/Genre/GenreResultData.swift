//
//  GenreResultData.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation

struct GenreResultData : Codable{
    let data : [GenreData]?

    enum CodingKeys: String, CodingKey {

        case data = "genres"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([GenreData].self, forKey: .data)
    }
}
