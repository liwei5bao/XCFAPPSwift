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
class XCFKitchenViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    ///cell的重用标识符
    let cellIdentifier = "XCFKitchenViewControllerCell"
    let cellSectionHeaderIdentifier = "XCFSectionHeaderIdentifier"
    let sectionHeaderHeight:CGFloat = 40
    ///headerView的模型
    var headerViewMolde:XCFKitchenHeaderModel?
    ///列表模型
    var dataModelArray:NSMutableArray = NSMutableArray()
    ///tableView
    lazy var mianTableView:UITableView? = {
        let table = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        return table
    }()
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
        self.view.addSubview(mianTableView!)
        self.mianTableView!.delegate = self
        self.mianTableView?.dataSource = self
        self.mianTableView!.separatorStyle = UITableViewCellSeparatorStyle.None
        self.mianTableView!.backgroundColor = UIColor.colorWithHexString(XCFCellMarginColor)
        self.mianTableView!.registerNib(UINib.init(nibName:"XCFKitchenRecipeCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.mianTableView?.registerClass(XCFSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: cellSectionHeaderIdentifier)
    }
    
    //MARK:tableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        self.mianTableView?.mj_footer.hidden = (self.dataModelArray.count == 0)
        return self.dataModelArray.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let model:XCFKitchenIssuesModel = self.dataModelArray[section] as! XCFKitchenIssuesModel
        return (model.items_count?.integerValue != nil) ? model.items_count!.integerValue : 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! XCFKitchenRecipeCell
        let issuseM = self.dataModelArray[indexPath.section] as! XCFKitchenIssuesModel
        let itemsModel = issuseM.items![indexPath.row] as! XCFKitchenItems
        cell.kitchenItemsModel = itemsModel
        return cell
    }
    //MARK:tableViewDeledate
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 260
//    }
//
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! XCFKitchenRecipeCell
        let issuseM = self.dataModelArray[indexPath.section] as! XCFKitchenIssuesModel
        let itemsModel = issuseM.items![indexPath.row] as! XCFKitchenItems
    
        return cell.cellHeightWithModel(itemsModel)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hederView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(cellSectionHeaderIdentifier) as! XCFSectionHeaderView
        let issuesModel = self.dataModelArray[section] as? XCFKitchenIssuesModel
        hederView.dateText?.text = issuesModel?.title
        return hederView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    //MARK:- 初始化headerView
    private func setupHeaderView(){
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: XCFKitchenHeaderViewH))
        let headerViewTop = XCFKitchenHeaderTopV.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 130 * scaleSize), pop_recipe_picurl: self.headerViewMolde!.pop_recipe_picurl!) { (index) in
            print(index)
        }
        let headerViewNav = XCFKitchenHeaderNavView.init(frame: CGRect.init(x: 0, y: headerViewTop.bottom, width: screenWidth, height: 80 * scaleSize), navModel: self.headerViewMolde!) { (index) in
            print(index)
        }
        let headerViewBottom = XCFKitchenHeaderScrollowView.init(frame: CGRect.init(x: 0, y: headerViewNav.bottom, width: screenWidth, height: 80 * scaleSize), pageModel: self.headerViewMolde!.pop_events!) { (index) in
            print(index)
        }
        headerView.addSubview(headerViewTop)
        headerView.addSubview(headerViewNav)
        headerView.addSubview(headerViewBottom)
        self.mianTableView!.tableHeaderView?.height = XCFKitchenHeaderViewH
        self.mianTableView!.tableHeaderView = headerView
        self.mianTableView!.reloadData()
    }
    
    ///MARK:-初始化上拉和下拉
    private func setupHeaderFooterRefresh(){
        self.mianTableView!.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(XCFKitchenViewController.headerRefresh))
        self.mianTableView!.mj_header.beginRefreshing()
        self.mianTableView!.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: #selector(XCFKitchenViewController.footerRefresh))
    }
    
    func headerRefresh(){
        self.loadNewData()
    }
    
    func footerRefresh(){
        self.loadNewData()
    }
    
    //MARK:加载网络数据的方法
    
    ///请求最新的列表数据
    private func loadNewData(){
        weak var wself = self
        XCFHttpsTool.dataRequest(method:.GET, urlString: XCFRequestKitchenListNew, parameter: nil) { (responseObject, error) in
            print(responseObject)
            if (error != nil){
                SVProgressHUD.showErrorWithStatus(XCFRequestError)
            }else{
                if responseObject != nil{
                    let modelArray = XCFKitchenIssuesModel.mj_objectArrayWithKeyValuesArray(((responseObject as! NSDictionary)["content"] as! NSDictionary)["issues"])
                    wself!.dataModelArray.addObjectsFromArray(modelArray as [AnyObject])
                    wself?.mianTableView!.reloadData()
                }
            }
            wself!.mianTableView!.mj_header.endRefreshing()
        }
    }
    ///请求导航数据
    private func loadTableViewHeaderData(){
        weak var wself = self
        XCFHttpsTool.dataRequest(method:.GET, urlString: XCFRequestKitchenNav, parameter: nil) { (responseObject, error) in
            if (error != nil){
                SVProgressHUD.showErrorWithStatus(XCFRequestError)
            }else{
                if responseObject != nil{
                    if (responseObject!.isKindOfClass(NSDictionary.self)){
                        let model = XCFKitchenHeaderModel.mj_objectWithKeyValues((responseObject as! NSDictionary)["content"])
                        self.headerViewMolde = model
                        wself?.setupHeaderView()
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
