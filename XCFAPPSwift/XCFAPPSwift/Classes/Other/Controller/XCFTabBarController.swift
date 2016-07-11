//
//  XCFTabBarController.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/7.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFTabBarController: UITabBarController {

    
    //这个方法，是当这个类第一次被创建时调用，且只调用一次
    override class func initialize() {
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes([NSForegroundColorAttributeName:XCFTabBarNormalColor,NSFontAttributeName:UIFont.systemFontOfSize(11)], forState: UIControlState.Normal)
        appearance.setTitleTextAttributes([NSForegroundColorAttributeName:XCFTabBarSelectColor,NSFontAttributeName:UIFont.systemFontOfSize(11)], forState: UIControlState.Selected)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupChildViewControllow(XCFKitchenViewController(), title: "下厨房", image: "tabADeselected", selectImage: "tabASelected")
        self.setupChildViewControllow(XCFKitchenViewController(), title: "市集", image: "tabBDeselected", selectImage: "tabBSelected")
        self.setupChildViewControllow(XCFKitchenViewController(), title: "邮件", image: "tabCDeselected", selectImage: "tabCSelected")
        self.setupChildViewControllow(XCFKitchenViewController(), title: "我", image: "tabDDeselected", selectImage: "tabDSelected")
    }
    
    ///添加一个子控制器
    private func setupChildViewControllow(childController:UIViewController,title:String,image:String,selectImage:String){
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: image)
        childController.tabBarItem.selectedImage = UIImage.init(named: selectImage)
        let navController = XCFNavigationController(rootViewController: childController)
        self.addChildViewController(navController)
    }
}
