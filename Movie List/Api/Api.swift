//
//  Api.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation
import Alamofire

class Api : NSObject{

    static func genreList(callback: @escaping (GenreResultData?)->Void) {
        
        let url = ConfigData.BASE_URL + "genre/movie/list?api_key=" + ConfigData.API_KEY
        print("---------->" + url)
        
        
        
        AF.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default).responseData { response in
            callback(decode(data: response.data, modelType: GenreResultData.self) as? GenreResultData)
        }
    }
    
    static func movieList(genreId : String, page : String, callback: @escaping (MovieListResultData?)->Void) {
        
        let url = ConfigData.BASE_URL + "discover/movie?api_key=" + ConfigData.API_KEY + "&page=" + page + "&with_genres=" + genreId
        print("---------->" + url)
        
        
        
        AF.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default).responseData { response in
            callback(decode(data: response.data, modelType: MovieListResultData.self) as? MovieListResultData)
        }
    }
    
    static func movieDescp(movie_id : String, callback: @escaping (MovieDescpResultData?)->Void) {
        
        let url = ConfigData.BASE_URL + "/movie/" + movie_id + "?api_key=" + ConfigData.API_KEY
        print("---------->" + url)
        
        
        
        AF.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default).responseData { response in
            callback(decode(data: response.data, modelType: MovieDescpResultData.self) as? MovieDescpResultData)
        }
    }
    
    static func userReview(movie_id : String, page : String, callback: @escaping (UserReviewResultData?)->Void) {
        
        let url = ConfigData.BASE_URL + "/movie/" + movie_id + "/reviews?api_key=" + ConfigData.API_KEY + "&page=" + page
        print("---------->" + url)
        
        
        
        AF.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default).responseData { response in
            callback(decode(data: response.data, modelType: UserReviewResultData.self) as? UserReviewResultData)
        }
    }
    
    static func movieTrailer(movie_id : String, callback: @escaping (TrailerResultData?)->Void) {
        
        let url = ConfigData.BASE_URL + "movie/" + movie_id + "/videos?api_key=" + ConfigData.API_KEY
        print("---------->" + url)
        
        
        
        AF.request(url, method: .get, parameters: nil, encoding:JSONEncoding.default).responseData { response in
            callback(decode(data: response.data, modelType: TrailerResultData.self) as? TrailerResultData)
        }
    }
    
    
    
    
    static func decode<T>(data:Data?, modelType: T.Type) ->AnyObject? where T : Decodable  {
        
        if(data != nil){
        
            print("<----------" + String(data: data!, encoding: String.Encoding.utf8)!)
           
            do{
                return try JSONDecoder().decode(modelType, from: data!) as AnyObject?
            
            }catch let error{
                print(error)
            
            }
            
        }
        return nil
        
    }
    
}
