//
//  HomeViewController+CollectionView.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK:- UICollectionViewDataSource methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let category = menuData.categories[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        
        
        cell.imgCategory.startAnimating()

        cell.lblCategoryTitle.text = category.title

        cell.imgCategory.sd_setImage(with: URL(string: category.imageHref)) { (img, error, cacheType, url) in
            cell.imgCategory.stopAnimating()
        }
        
        return cell
    }
    
    //MARK:- UICollectionViewDelegate methods

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        navigateToMenuScreen(with: indexPath.item)
    }
    
    //MARK:- UICollectionViewDelegateFlowLayout methods

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = collectionView.bounds.size.width - (Constants.COLLECTION_VIEW_INTERI_ITEM_SPACING + Constants.COLLECTION_VIEW_INSET_RIGHT + Constants.COLLECTION_VIEW_INSET_LEFT)
        width = width / 2
        return CGSize(width: width, height: width)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.COLLECTION_VIEW_LINE_SPACING
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.COLLECTION_VIEW_INTERI_ITEM_SPACING
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(Constants.COLLECTION_VIEW_INSET_TOP, Constants.COLLECTION_VIEW_INSET_LEFT, Constants.COLLECTION_VIEW_INSET_BOTTOM, Constants.COLLECTION_VIEW_INSET_RIGHT)
    }
    
    //MARK:- UICollectionViewDelegateFlowLayout methods
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionElementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath)
        carouselView.frame = view.bounds
        view.addSubview(carouselView)
    
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.width * 0.35)

    }
}
