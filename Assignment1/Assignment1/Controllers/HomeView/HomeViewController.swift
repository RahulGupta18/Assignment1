//
//  HomeViewController.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import UIKit
import SDWebImage
import iCarousel

class HomeViewController: UIViewController {

    var menuData: FoodMenuData = FoodMenuData()

    @IBOutlet weak var clviwHome: UICollectionView!
    
    var carouselView: iCarousel = iCarousel()

    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setHomeScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Methods
    
    func setHomeScreen() {
        
        carouselView = iCarousel(frame: CGRect(x: 0, y: 0, width: clviwHome.bounds.size.width, height: clviwHome.bounds.size.width * 0.35))
        carouselView.type = .linear
        carouselView.isPagingEnabled = true
        carouselView.delegate = self
        carouselView.dataSource = self
        
        clviwHome.dataSource = self
        clviwHome.delegate = self
        
        // Get data from stub file
        Parser.parseStubData(onSuccess: { (parsedData) in
            if let foodData  = parsedData {
                menuData = foodData
                
                carouselView.reloadData()
                clviwHome.reloadData()
            }
        }) { (err) in
            Utility.showAlert(title: Constants.ALERT_ERROR_TITLE, message: err.localizedDescription, buttonText: Constants.ALERT_OK, viewController: self)
        }
    }
}

