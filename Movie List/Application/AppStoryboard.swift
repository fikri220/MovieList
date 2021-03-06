//
//  AppStoryboard.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation
import UIKit

enum AppStoryboard : String {
    case Main, MovieDetail
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T{
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
    
}
