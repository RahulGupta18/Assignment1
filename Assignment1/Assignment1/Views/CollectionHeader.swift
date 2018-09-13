//
//  CollectionHeader.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/13/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation
import UIKit
import iCarousel

class CollectionHeader: UICollectionReusableView {
    
    @IBOutlet weak var carouselView: iCarousel!
    @IBOutlet weak var btnLeftArrow: UIButton!
    @IBOutlet weak var btnRightArrow: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    func setHeader() {
        
        btnLeftArrow.layer.shadowColor = UIColor.black.cgColor
        btnLeftArrow.layer.shadowOffset = CGSize(width: 5, height: 5)
        btnLeftArrow.layer.shadowRadius = 5
        btnLeftArrow.layer.shadowOpacity = 1.0
        
        btnRightArrow.layer.shadowColor = UIColor.black.cgColor
        btnRightArrow.layer.shadowOffset = CGSize(width: 5, height: 5)
        btnRightArrow.layer.shadowRadius = 5
        btnRightArrow.layer.shadowOpacity = 1.0
        
        carouselView.type = .linear
        carouselView.isPagingEnabled = true
        carouselView.bounces = false
        
        pageControl.currentPage = carouselView.currentItemIndex
    }
    
    // MARK: IBAction Methods
    
    @IBAction func btnLeftArrowTouched(_ sender: UIButton) {
        
        if carouselView.currentItemIndex > 0 {
            carouselView.scrollToItem(at: carouselView.currentItemIndex - 1, animated: true)
            pageControl.currentPage = carouselView.currentItemIndex - 1
        }
    }
    
    @IBAction func btnRightArrowTouched(_ sender: UIButton) {
        
        if carouselView.currentItemIndex < carouselView.numberOfItems - 1 {
            carouselView.scrollToItem(at: carouselView.currentItemIndex + 1, animated: true)
            pageControl.currentPage = carouselView.currentItemIndex + 1
        }
    }
}
