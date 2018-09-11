//
//  MenuViewController.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/12/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var tblProducts: UITableView!
    @IBOutlet weak var lblDesc: UILabel!

    var products: [Product] = []
    var desc: String = ""
    
    // MARK: View Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setMenuView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let headerView = tblProducts.tableHeaderView else {
            return
        }
        
        let size = headerView.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tblProducts.tableHeaderView = headerView
            tblProducts.layoutIfNeeded()
        }
    }
    
    func setMenuView() {
        
        lblDesc.text = desc
        
        tblProducts.dataSource = self
        tblProducts.delegate = self
        
        tblProducts.rowHeight = UITableViewAutomaticDimension
        tblProducts.estimatedRowHeight = 400
        

        tblProducts.tableFooterView = UIView.init(frame: .zero)
        
        tblProducts.reloadData()
    }
}
