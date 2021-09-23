//
//  MovieDescpViewModel.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import Foundation

class MovieDescpViewModel {
    weak var appCoordinator : MovieDetailCoordinator!
    var bindVMToController : (() -> ()) = {}
    var bindVMToControllerTrailer : (() -> ()) = {}
    var movie_id : Int!
    
    var moviesDescpData : MovieDescpResultData! {
        didSet{
            self.bindVMToController()
        }
    }
    
    var trailerKey : String = "" {
        didSet{
            self.bindVMToControllerTrailer()
        }
    }
    
    
    
    func goToUserReview(){
        appCoordinator.goToUserReview(movie_id: movie_id)
    }
    
    func getMovieDescp(){
        
        Api.movieDescp(movie_id : String(movie_id) ,callback:{ result in
            self.moviesDescpData = result
        })
        
        Api.movieTrailer(movie_id : String(movie_id),callback:{ result in
            if let res = result{
                if(res.data != nil && res.data?.count ?? 0 > 0){
                    self.trailerKey = res.data![0].key!
        
                }else{
        
                }
        
            }else{
        
            }
        
        })
    }
    
}
