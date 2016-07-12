//
//  XCFKitchenViewController.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/7.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import SVProgressHUD
import MJExtension
import SDWebImage
class XCFKitchenViewController: UITableViewController{
    ///cell的重用标识符
    let cellIdentifier = "XCFKitchenViewControllerCell"
    ///headerView的模型
    var headerViewMolde:XCFKitchenHeaderModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavgationBar()
        self.setupTableView()
//        self.setupHeaderView()
        self.setupHeaderFooterRefresh()
        //加载网络数据
        self.loadTableViewHeaderData()
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
    
    //MARK:-初始化tableView
    private func setupTableView(){
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.backgroundColor = XCFGlobalBackgroundColor
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    ////MARK:tableViewDeledate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    //MARK:- 初始化headerView
    private func setupHeaderView(){
//      let headerView = XCFKitchenHeaderTopV.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 130 * scaleSize), pop_recipe_picurl: self.headerViewMolde!.pop_recipe_picurl!) { (index) in
//        
//            print(index)
//        }
        
        let headerView1 = XCFKitchenHeaderNavView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 80 * scaleSize), navModel: self.headerViewMolde!) { (index) in
            
        }
        
        self.tableView.tableHeaderView?.height = 80 * scaleSize
        self.tableView.tableHeaderView = headerView1
        self.tableView.reloadData()
    }
    
    ///MARK:-初始化上拉和下拉
    private func setupHeaderFooterRefresh(){
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(XCFKitchenViewController.headerRefresh))
        self.tableView.mj_header.beginRefreshing()
        self.tableView.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(XCFKitchenViewController.footerRefresh))
    }
    
    func headerRefresh(){
        self.tableView.mj_header.endRefreshing()
    }
    
    func footerRefresh(){
        self.tableView.mj_footer.endRefreshing()
    }
    
    ////MARK:加载网络数据的方法
    private func loadTableViewHeaderData(){
        //请求导航数据
        weak var wself = self
        XCFHttpsTool.dataRequest(method:.GET, urlString: XCFRequestKitchenNav, parameter: nil) { (responseObject, error) in
            print(responseObject)
            if (error != nil){
                SVProgressHUD.showErrorWithStatus(XCFRequestError)
            }else{
                if responseObject != nil{
                    if (responseObject!.isKindOfClass(NSDictionary.self)){
                        let model = XCFKitchenHeaderModel.mj_objectWithKeyValues((responseObject as! NSDictionary)["content"])
                        self.headerViewMolde = model
                        wself?.setupHeaderView()
                        print((model.pop_events?.events?.lastObject as! XCFKitchenPopEventModel).name)
                    }
                }
            }
        }
    }
    
    //MARK:---------处理事件
    ///创建菜谱
    func createRecipe(){
        
        
    }
    
    ///菜篮子
    func buylist(){
    
        
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }
}
