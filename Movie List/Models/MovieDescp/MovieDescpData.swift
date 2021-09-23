//
//  MovieDescpData.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import Foundation

class MoviewDescpData :Codable {
    
    let vote_average : Double?
    let title : String?
    let release_date : String?
    let id : Int?
    let backdrop_path : String?
    let overview : String?
    let budget : Int?
    let revenue : Int?
    
    enum CodingKeys: String, CodingKey {

        case vote_average = "vote_average"
        case title = "title"
        case release_date = "release_date"
        case id = "id"
        case backdrop_path = "backdrop_path"
        case overview = "overview"
        case budget = "budget"
        case revenue = "revenue"

    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        budget = try values.decodeIfPresent(Int.self, forKey: .budget)
        revenue = try values.decodeIfPresent(Int.self, forKey: .revenue)
        
    }

    
}
