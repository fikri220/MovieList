//
//  MovieListViewModel.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import Foundation

class MovieListViewModel {
    
    weak var appCoordinator : MainCoordinator!
    var genreItem : GenreItem!
    var bindVMToController : (() -> ()) = {}
    var page : Int = 1
    var loadmore = true
    var movieList : [MovieListData] = [] {
        didSet{
            self.bindVMToController()
        }
    }
    
    
    func goToMovieDetail(movie_id : Int){
        appCoordinator.goToMovieDetail(movie_id: movie_id)
    }
    
    
    func getMovieList(){
        
            Api.movieList(genreId : String(genreItem.id), page : String(page),callback:{ result in
                if let res = result{
                    if(res.data != nil){
                        self.movieList = res.data!
        
                    }else{
        
                    }
        
                }else{
    
                }
                
            })
        
    }
    
    func loadMoreMovie(){
        if loadmore {
            page += 1
            Api.movieList(genreId : String(genreItem.id), page : String(page),callback:{ result in
                if let res = result{
                    if(res.data != nil && res.data?.count ?? 0 > 0){
                        self.movieList += res.data!
                    
                    }else{
                        self.loadmore = false
                        
                    }
        
                }else{
        
                }
        
            })
        }
    }
    
}
