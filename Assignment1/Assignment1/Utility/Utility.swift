//
//  Utility.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    
    static func showAlert(title: String, message: String, buttonText: String, viewController: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonText, style: UIAlertActionStyle.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    
    static func setNavigationBarAppearance() {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = Constants.NAVIGATIONBAR_TINT_COLOUR
        
        navigationBarAppearace.barTintColor = Constants.NAVIGATIONBAR_BARTINT_COLOUR
        
        // change navigation item title color
        navigationBarAppearace.titleTextAttributes = [NSAttributedStringKey.foregroundColor: Constants.NAVIGATIONBAR_TITLE_COLOUR]
    }
}
