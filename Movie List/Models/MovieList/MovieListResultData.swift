//
//  MovieListResultData.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import Foundation

struct MovieListResultData : Codable{
    let data : [MovieListData]?

    enum CodingKeys: String, CodingKey {

        case data = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([MovieListData].self, forKey: .data)
    }
}
