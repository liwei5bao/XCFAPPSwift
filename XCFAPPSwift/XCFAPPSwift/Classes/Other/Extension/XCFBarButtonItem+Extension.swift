//
//  XCFBarButtonItem+Extension.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/11.
//  Copyright © 2016年 liwei. All rights reserved.
//  导航栏item的拓展

import UIKit
extension UIBarButtonItem{
    ///创建左边的item
    class func barButtonLeftItemWithImageName(imageName:String,target:AnyObject?,action:Selector)->UIBarButtonItem{
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 22))
        button.setImage(UIImage.init(named: imageName), forState: UIControlState.Normal)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        return barButtonItem
    }
    ///创建右边的item
    class func barButtonRightItemWithImageName(imageName:String,target:AnyObject?,action:Selector)->UIBarButtonItem{
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 22))
        button.setImage(UIImage.init(named: imageName), forState: UIControlState.Normal)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 28, 0, 0)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        return barButtonItem
    }
    ///创建自定义的item
    class func barButtonItemWithImageName(imageName:String,target:AnyObject?,action:Selector,imageEdgeInsets:UIEdgeInsets)->UIBarButtonItem{
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 22))
        button.setImage(UIImage.init(named: imageName), forState: UIControlState.Normal)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        button.imageEdgeInsets = imageEdgeInsets
        let barButtonItem = UIBarButtonItem.init(customView: button)
        return barButtonItem
    }
    ///创建文字形式的item
    class func barButtonItemWithTitle(title:String,selectTitle:String,target:AnyObject?,action:Selector)->UIBarButtonItem{
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 22))
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitle(selectTitle, forState: UIControlState.Selected)
        button.titleLabel?.font = UIFont.systemFontOfSize(16)
//        button.setTitleColor(<#T##color: UIColor?##UIColor?#>, forState: <#T##UIControlState#>)
        button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        let barButtonItem = UIBarButtonItem.init(customView: button)
        return barButtonItem
    }
}
