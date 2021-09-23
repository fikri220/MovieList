//
//  HomeViewModel.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation

class HomeViewModel {
    weak var appCoordinator : MainCoordinator!
    
    func goToGenre(){
        appCoordinator.goToGenre()
    }
    
}
