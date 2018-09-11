//
//  HomeViewController.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        parseJsonData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func parseJsonData() {
        
        do {
            let path = Bundle.main.path(forResource: "box8_stub", ofType: "json")
            
            let fileContent = try NSString(contentsOfFile: path!, encoding: String.Encoding.ascii.rawValue)
            let encodedString = fileContent.data(using: String.Encoding.utf8.rawValue)! as Data
            let parsedData = try JSONDecoder().decode(FoodMenuData.self, from: encodedString)
            print(parsedData.categories.count)
            
        } catch let error {
            
            print(error)
        }
    }

}

