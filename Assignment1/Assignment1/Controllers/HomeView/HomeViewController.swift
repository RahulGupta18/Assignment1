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
import SJSegmentedScrollView

class HomeViewController: UIViewController, SJSegmentedViewControllerDelegate {

    var menuData: FoodMenuData = FoodMenuData()

    var segmentedViewController = SJSegmentedViewController()
    
    var selectedIndex = 0

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
    
    func navigateToMenuScreen(with index: Int) {
        
        selectedIndex = index
        
        if let storyboard = self.storyboard {
            
            var controllers: [MenuViewController] = [MenuViewController]()
            
            for category in menuData.categories {
                
                let vcMenuView = storyboard.instantiateViewController(withIdentifier: "MenuView") as! MenuViewController
                vcMenuView.title = category.title
                vcMenuView.desc = category.desc
                vcMenuView.products = category.products                
                controllers.append(vcMenuView)
            }
            
            segmentedViewController = SJSegmentedViewController(headerViewController: nil, segmentControllers: controllers)
            segmentedViewController.delegate = self
            
            //Set color for selected segment.
            segmentedViewController.selectedSegmentViewColor = UIColor.red
            
            //Set color for segment title.
            segmentedViewController.segmentTitleColor = UIColor.gray
            
            //Set background color for segmentview.
            segmentedViewController.segmentBackgroundColor = UIColor.white
            
            //Set shadow for segmentview.
            segmentedViewController.segmentShadow = SJShadow.light()
            
            //Set bounce for segmentview.
            segmentedViewController.segmentBounces = true
            
            self.navigationController?.pushViewController(segmentedViewController, animated: true)
            
            self.perform(#selector(moveSegmentToIndex), with: nil, afterDelay: 0.2)
        }
    }
    
    @objc func moveSegmentToIndex() {
        segmentedViewController.setSelectedSegmentAt(selectedIndex, animated: false)
    }
    
    // MARK: SJSegmentedViewControllerDelegate Methods
    
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {
        
        //self.segmentedViewController.reloadInputViews()

        if segmentedViewController.segments.count > 0 {
            
            let segmentTab = segmentedViewController.segments[index]
            segmentTab.titleColor(UIColor.black)
        }
    }
}

