//
//  XCFKitchenIssuesModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/14.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenIssuesModel: NSObject {
    ///菜谱数量
    var items_count:NSInteger?
    ///标题
    var title:String?
    ///菜谱数组
    var items:NSArray?
    ///当天菜谱id
    var issue_id:String?
    ///菜谱发布日期
    var publish_date:String?
    
    override class func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["items":XCFKitchenItems.self]
    }
}
