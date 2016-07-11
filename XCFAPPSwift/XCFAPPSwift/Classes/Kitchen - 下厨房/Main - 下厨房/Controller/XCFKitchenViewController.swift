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
        ///搜索框成为第一响应者
        weak var wself = self
        searchBar.searchBarShouldBeginEditingBlock = {
        
            wself!.navigationItem.leftBarButtonItem = nil
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithImageName("homepageCreateRecipeButton", target: self, action: #selector(XCFKitchenViewController.createRecipe), imageEdgeInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 8))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithImageName("buylistButtonImage", target: self, action: #selector(XCFKitchenViewController.buylist), imageEdgeInsets: UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 0))
    }
    
    //MARK:---------处理事件
    ///创建菜谱
    func createRecipe(){
    
    }
    
    ///菜篮子
    func buylist(){
    
    }
}
