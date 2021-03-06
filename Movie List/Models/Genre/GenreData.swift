//
//  GenreData.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation

class GenreData :Codable {
    
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"

    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

    
}
