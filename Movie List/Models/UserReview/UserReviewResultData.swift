//
//  UserReviewResultData.swift
//  Movie List
//
//  Created by Fikri Ihsan on 23/09/21.
//

import Foundation

struct UserReviewResultData : Codable{
    let data : [UserReviewData]?

    enum CodingKeys: String, CodingKey {

        case data = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([UserReviewData].self, forKey: .data)
    }
}
