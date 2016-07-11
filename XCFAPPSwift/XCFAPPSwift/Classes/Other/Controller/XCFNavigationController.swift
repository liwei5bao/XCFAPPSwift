//
//  XCFNavigationController.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/7.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFNavigationController: UINavigationController {

    
    override class func initialize(){
        //设置左右item的属性
        self.setupTabButtonItem()
        //设置标题栏的字体颜色
        self.setupNavTabBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:设置标题中左右button的属性
    private class func setupTabButtonItem(){
        let barBtnAppearance = UIBarButtonItem.appearance()
        barBtnAppearance.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(17)], forState: UIControlState.Normal)
        barBtnAppearance.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(17)], forState: UIControlState.Highlighted)
    }
    
    //MARK:设置标题栏的字体颜色和属性
    private class func setupNavTabBar(){
        let navAppearance = UINavigationBar.appearance()
        navAppearance.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blackColor(),NSFontAttributeName:UIFont.boldSystemFontOfSize(20)]
        //设置背景图片
//        navAppearance.setBackgroundImage(UIImage.resizedImageWithName("bg"), forBarMetrics: UIBarMetrics.Default)
    }
    
    //MARK:跳转控制器的处理
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if (self.viewControllers.count > 0) {
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "Goback"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(XCFNavigationController.pop))
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    //MARK:弹出控制器
    func pop(){
        self.popViewControllerAnimated(true)
    }
}
