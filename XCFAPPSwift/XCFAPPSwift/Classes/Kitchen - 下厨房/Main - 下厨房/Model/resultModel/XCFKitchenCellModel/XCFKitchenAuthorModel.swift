//
//  XCFKitchenAuthorModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/14.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenAuthorModel: NSObject {
    ///本地头像
    var image:UIImage?
    ///头像  头像 (尺寸60）
    var photo:String?
    /// 头像（尺寸60）
    var photo60:String?
    /// 头像（尺寸160）
    var photo160:String?
    /// 昵称 
    var name:String?
    /// 是否专家 
    var is_expert:Bool?
    /// 当前地址 
    var current_location:String?
    /// 家乡 
    var hometown_location:String?
    /// 邮箱 
    var mail:String?
    /// 用户id 
    var ID:String?
    
    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
}
