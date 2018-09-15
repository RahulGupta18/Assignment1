//
//  MenuViewController+TableView.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/12/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation
import UIKit

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let product = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.imgProduct.sd_setShowActivityIndicatorView(true)
        cell.imgProduct.sd_setIndicatorStyle(.white)
        cell.imgProduct.sd_setImage(with: URL(string: product.imageUrl), completed: { (img, err, cacheType, url) in})
        
        cell.lblProductName.text = product.name
        cell.lblProductDetails.text = product.details
        cell.lblProductPrice.text = product.price
        
        return cell
    }
}
