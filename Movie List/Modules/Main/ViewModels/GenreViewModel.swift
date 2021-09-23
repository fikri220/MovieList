//
//  GenreViewModel.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import Foundation

struct GenreItem {
    var name : String!
    var id : Int!
}

class GenreViewModel {
    
    weak var appCoordinator : MainCoordinator!
    var bindVMToController : (() -> ()) = {}
    
    var genreList : [GenreData] = [] {
        didSet{
            self.bindVMToController()
        }
    }
    
    
    func goToMovieList(genreItem : GenreItem){
        appCoordinator.goToMovieList(genreItem: genreItem)
    }
    
    func getGenreList(){
        Api.genreList(callback:{ result in
            if let res = result{
                if(res.data != nil){
                    self.genreList = res.data!
        
                }else{
        
                }
        
            }else{
        
            }
        
        })
        
    }
    
}
