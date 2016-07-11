//
//  OtherUtil.swift
//  ProjectFramework
//
//  Created by kouclo on 16/7/5.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class OtherUtil: NSObject {

    ///取出当前栈顶的View
    class func getNavTopView()->(UIView?){
        let vc = self.getCurrentVC()
        if (vc.isKindOfClass(UITabBarController.self)) {
            let tabVC = vc as! UITabBarController
            let navVC = tabVC.selectedViewController as! UINavigationController
            return navVC.topViewController?.view
        }
        return nil
    }
    
    ///获取当前屏幕显示的VC
    class func getCurrentVC()->(UIViewController){
        var result:UIViewController?
        var window = UIApplication.sharedApplication().keyWindow
        if (window?.windowLevel != UIWindowLevelNormal) {
            let windows = UIApplication.sharedApplication().windows
            for tempWindow in windows{
                if (tempWindow.windowLevel == UIWindowLevelNormal) {
                    window = tempWindow
                    break
                }
            }
        }
        let frontView:UIView? = window?.subviews[0]
        let nextResponder = frontView?.nextResponder()
        if (nextResponder!.isKindOfClass(UIViewController.self)) {
            result = nextResponder as? UIViewController
        }else{
            result = window?.rootViewController
        }
        return result!
    }
}
