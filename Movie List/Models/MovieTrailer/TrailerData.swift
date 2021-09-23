//
//  TrailerData.swift
//  Movie List
//
//  Created by Fikri Ihsan on 23/09/21.
//

import Foundation

class TrailerData :Codable {
    
    let key : String?

    enum CodingKeys: String, CodingKey {

        case key = "key"

    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
    }

    
}
