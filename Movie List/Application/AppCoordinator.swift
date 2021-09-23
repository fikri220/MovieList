//
//  AppCoordinator.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation
import UIKit

class AppCoordinator : Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        print("Start")
        goToMain()
    }
    
    func goToMain(){
        // For the first time, the app is going to go to Main module
        let mainCoordinator = MainCoordinator.init(navigationController: navigationController)
        mainCoordinator.parentCoordinator = self
        children.append(mainCoordinator)
        
        mainCoordinator.start()
    }
  
    
    deinit {
        print("AppCoordinator Deinit")
    }
    
    
}
