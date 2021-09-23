//
//  ViewControllerExtension.swift
//  Movie List
//
//  Created by Fikri Ihsan on 21/09/21.
//

import Foundation
import UIKit

extension UIViewController{
    class var storyboardID : String {
        return "\(self)"
    }
    
    static func instantiateFromAppStoryboard(appStoryboard : AppStoryboard) -> Self{
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

