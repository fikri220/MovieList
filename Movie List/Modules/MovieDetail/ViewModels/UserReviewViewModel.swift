//
//  UserReviewViewModel.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import Foundation

class UserReviewViewModel {
    weak var appCoordinator : MovieDetailCoordinator!
    var bindVMToController : (() -> ()) = {}
    var movie_id : Int!
    var page : Int = 1
    var loadmore = true
    
    var userReviewList : [UserReviewData] = [] {
        didSet{
            if(userReviewList.count > 0){
                self.bindVMToController()
            }else{
                self.appCoordinator.closePresent()
            }
            
        }
    }
    
    
    
    func getUserReview(){
        Api.userReview(movie_id : String(movie_id), page : String(page),callback:{ result in
            if let res = result{
                if(res.data != nil){
                    self.userReviewList += res.data!
        
                }else{
        
                }
        
            }else{
        
            }
        
        })
    }
    
    func loadmoreReview(){
        if loadmore {
            page += 1
            Api.userReview(movie_id : String(movie_id), page : String(page),callback:{ result in
                if let res = result{
                    if(res.data != nil && res.data?.count ?? 0 > 0){
                        self.userReviewList += res.data!
        
                    }else{
                        self.loadmore = false
        
                    }
        
                }else{
        
                }
        
            })
        }
    }
    
}
