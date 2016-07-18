//
//  XCFKitchenItems.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/14.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFKitchenItems: NSObject {

    ///发布日期
    var publish_time:String?
    ///网页URL
    var url:String?
    ///模板
    var template:NSNumber?
    ///id
    var ID:String?
    ///模板内容
    var contents:XCFKitchenContentsModel?
    /** cellHeight */
    var cellHeight:CGFloat?
    
    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
}
