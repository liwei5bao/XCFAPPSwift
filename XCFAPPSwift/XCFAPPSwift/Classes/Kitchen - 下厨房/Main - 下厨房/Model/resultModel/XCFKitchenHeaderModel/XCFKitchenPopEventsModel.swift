//
//  XCFKitchenPopEventsModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//  下厨房首页表头早餐午餐晚餐数组的model

import UIKit

class XCFKitchenPopEventsModel: NSObject {
    ///导航个数
    var count:NSInteger?
    ///导航数据
    var events:NSArray?
    
    override class func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["events":XCFKitchenPopEventModel.self]
    }
}
