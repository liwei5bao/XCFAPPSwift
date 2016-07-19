//
//  XCFRecipeViewController.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/18.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit
import SVProgressHUD

class XCFRecipeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //控件
    ///顶部播放视频的view
    var topVideoView: XCFRecipeTopVideoView?
    ///tableView头部
    var headerView: UIView?
    ///tableView底部
    var footerView: UIView?
    //数据
    var recipe:XCFRecipeModel?
    var dish:NSMutableArray?
    var addedList:NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
//        self.loadNewData()
        self.setupVideoView()
        self.setupTable()
        
    }

    //MARK:数据源
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
//        cell.textLabel?.text = "\(indexPath.row)"
        cell.contentView.backgroundColor = UIColor.redColor()
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print(offsetY)
        var videoVF = self.topVideoView?.frame
        if (offsetY < -XCFRecipeTopVideoViewHeight) {
            videoVF?.size.height = -offsetY
            videoVF?.origin.y = 64
            self.topVideoView?.frame = videoVF!
        }else{
            if (offsetY <= 0) {
                videoVF?.origin.y = -(offsetY + XCFRecipeTopVideoViewHeight) * 0.4 + 64
                self.topVideoView?.frame = videoVF!
//                self.mainTableView.contentInset = UIEdgeInsets.init(top: -offsetY, left: 0, bottom: 0, right: 0 )
            }
        }
    }
    
    
    //MARK:代理
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    //初始化视频播放的view
    private func setupVideoView(){
        let videoV = XCFRecipeTopVideoView.init(frame: CGRect.init(x: 0, y: 64, width: screenWidth, height: XCFRecipeTopVideoViewHeight))
        self.view.addSubview(videoV)
        self.topVideoView = videoV
    }
    
    //初始化tableView
    private func setupTable(){
        self.view.backgroundColor = UIColor.colorWithHexString(XCFRecipeViewBackColor)
        self.view.addSubview(self.mainTableView)
        self.mainTableView.frame = CGRect.init(x: 0, y: 64, width: screenWidth, height: screenHeight - 64)
        self.mainTableView.backgroundColor = UIColor.clearColor()
        self.mainTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.mainTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.mainTableView.contentInset = UIEdgeInsets.init(top: XCFRecipeTopVideoViewHeight, left: 0, bottom: 0, right: 0)
    }
    
    //MARK:加载网络数据的方法
    ///请求最新的列表数据
    private func loadNewData(){
        weak var wself = self
        //菜谱数据
        XCFHttpsTool.dataRequest(method:.GET, urlString: XCFRequestKitchenRecipe, parameter: nil) { (responseObject, error) in
            print(responseObject)
            if (error != nil){
                SVProgressHUD.showErrorWithStatus(XCFRequestError)
            }else{
                if responseObject != nil{
                    self.recipe = XCFRecipeModel.mj_objectWithKeyValues(((responseObject as! NSDictionary)["content"] as! NSDictionary)["recipe"])
                    
                    wself?.mainTableView.reloadData()
                }
            }
        }
        
        //作品数据
        XCFHttpsTool.dataRequest(method:.GET, urlString: XCFRequestKitchenRecipeDish, parameter: nil) { (responseObject, error) in
            print(responseObject)
            if (error != nil){
                SVProgressHUD.showErrorWithStatus(XCFRequestError)
            }else{
                if responseObject != nil{
                    self.dish = XCFDishModel.mj_objectArrayWithKeyValuesArray(((responseObject as! NSDictionary)["content"] as! NSDictionary)["dishes"])
                    
                    wself?.mainTableView.reloadData()
                }
            }
        }
        
        //被加入菜单数据
        XCFHttpsTool.dataRequest(method:.GET, urlString: XCFRequestKitchenAddedRecipeList, parameter: nil) { (responseObject, error) in
            print(responseObject)
            if (error != nil){
                SVProgressHUD.showErrorWithStatus(XCFRequestError)
            }else{
                if responseObject != nil{
                    self.addedList = XCFRecipeList.mj_objectArrayWithKeyValuesArray(((responseObject as! NSDictionary)["content"] as! NSDictionary)["recipe_lists"])
                    
                    wself?.mainTableView.reloadData()
                }
            }
        }
    }
    
    //MARK:懒加载
    var mainTableView: UITableView = {
       let table = UITableView()
        return table
    }()
}
