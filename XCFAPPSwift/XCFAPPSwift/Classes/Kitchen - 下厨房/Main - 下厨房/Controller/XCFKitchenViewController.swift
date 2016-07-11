//
//  XCFKitchenViewController.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/7.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavgationBar()
    }
    
    ///MARK:-初始化导航栏
    private func setupNavgationBar(){
        let searchBar = XCFSearchBar.searchBarWithPlaceholder("菜谱、食材")
        self.navigationItem.titleView = searchBar
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: <#T##UIBarButtonSystemItem#>, target: <#T##AnyObject?#>, action: <#T##Selector#>)
    }
}
