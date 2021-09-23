//
//  MovieDetailCoordinator.swift
//  Movie List
//
//  Created by Fikri Ihsan on 22/09/21.
//

import Foundation
import UIKit
class MovieDetailCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("MainCoordinator Start")
        //goToMovieDescp()
        
    }
    
    func goToMovieDescp(movie_id:Int){
        let movieDescpVC = AppStoryboard.MovieDetail.viewController(viewControllerClass: MovieDescpViewController.self)
        
        let movieDescpVM = MovieDescpViewModel.init()
        movieDescpVM.appCoordinator = self
        movieDescpVM.movie_id = movie_id
        movieDescpVC.viewModel = movieDescpVM
        navigationController.pushViewController(movieDescpVC, animated: true)
    }
    
    func goToUserReview(movie_id:Int){
        let userReviewVC = AppStoryboard.MovieDetail.viewController(viewControllerClass: UserReviewViewController.self)
        
        let userReviewVM = UserReviewViewModel.init()
        userReviewVM.appCoordinator = self
        userReviewVM.movie_id = movie_id
        userReviewVC.viewModel = userReviewVM
        navigationController.present(userReviewVC, animated: true)
    }
    
    func closePresent(){
        navigationController.dismiss(animated: true)
        
    }
    
 
    
}
