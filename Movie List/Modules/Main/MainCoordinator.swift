//
//  MainCoordinator.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("MainCoordinator Start")
        goToHome()
        
    }
    
    func goToHome(){
        let homeVC = AppStoryboard.Main.viewController(viewControllerClass: HomeViewController.self)
        
        let homeViewModel = HomeViewModel.init()
        homeViewModel.appCoordinator = self
        homeVC.viewModel = homeViewModel
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func goToGenre(){
        let genreVC = AppStoryboard.Main.viewController(viewControllerClass: GenreViewController.self)
        
        let genreVM =  GenreViewModel.init()
        genreVM.appCoordinator = self
        genreVC.viewModel = genreVM
        
        navigationController.present(genreVC, animated: true)
    }
    
    func goToMovieList(genreItem:GenreItem){
        let movieListVC = AppStoryboard.Main.viewController(viewControllerClass: MovieListViewController.self)
        
        let movieListVM =  MovieListViewModel.init()
        movieListVM.appCoordinator = self
        movieListVM.genreItem = genreItem
        movieListVC.viewModel = movieListVM
        
        navigationController.dismiss(animated: true)
        navigationController.pushViewController(movieListVC, animated: true)
    }
    
    func goToMovieDetail(movie_id : Int){
        let movieDetailCoordinator = MovieDetailCoordinator.init(navigationController: navigationController)
        movieDetailCoordinator.parentCoordinator = self
        children.append(movieDetailCoordinator)
        
        movieDetailCoordinator.goToMovieDescp(movie_id: movie_id)
    }
    
    
    
    
    
}
