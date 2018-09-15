//
//  HomeViewController+Carousel.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation
import UIKit
import iCarousel

extension HomeViewController: iCarouselDataSource {
    
    //MARK:- iCarouselDataSource Methods
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return menuData.headers.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var itemView: UIImageView
        
        //reuse view if available, otherwise create a new view
        if let view = view as? UIImageView {
            itemView = view
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values later
            itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: carousel.frame.size.width, height: carousel.frame.size.height))
            itemView.contentMode = .scaleAspectFit
        }
        
        itemView.sd_setShowActivityIndicatorView(true)
        itemView.sd_setIndicatorStyle(.white)
        itemView.sd_setImage(with: URL(string: menuData.headers[index]), completed: { (img, err, cacheType, url) in})
        
        return itemView
    }
}
