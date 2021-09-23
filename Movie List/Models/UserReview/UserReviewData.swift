//
//  UserGroupData.swift
//  Movie List
//
//  Created by Fikri Ihsan on 23/09/21.
//

import Foundation

class UserReviewData : Codable {
    
    let author : String?
    let content : String?
    let created_at : String?

    enum CodingKeys: String, CodingKey {

        case author = "author"
        case content = "content"
        case created_at = "created_at"

    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
    }

    
}
