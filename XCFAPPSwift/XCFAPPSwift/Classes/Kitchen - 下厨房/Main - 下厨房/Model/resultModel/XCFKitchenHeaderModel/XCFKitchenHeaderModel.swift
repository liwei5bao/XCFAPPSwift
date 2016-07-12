//
//  XCFKitchenHeaderModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/12.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenHeaderModel: NSObject {
    
    ///菜谱导航图片
    var pop_recipe_picurl:String?
    ///导航按钮数据
    var navs:NSArray?
    ///早餐午餐晚餐数据
    var pop_events:XCFKitchenPopEventsModel?
    
    override class func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["navs":XCFKitchenNavsModel.self]
    }
}
