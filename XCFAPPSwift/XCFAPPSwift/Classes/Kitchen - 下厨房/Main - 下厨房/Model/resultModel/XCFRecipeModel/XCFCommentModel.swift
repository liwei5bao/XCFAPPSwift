//
//  XCFCommentModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFCommentModel: NSObject {
    /** 作者 */
    var author:XCFKitchenAuthorModel?
    /** 未知 */
    var at_users:NSArray?
    /** 事件id */
    var target_id:String?
    /** 评论创建时间 */
    var create_time:String?
    /** 评论内容 */
    var txt:String?
    /** id */
    var ID:String?
    
    
    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
    
    override class func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["at_users":XCFKitchenAuthorModel.self]
    }
}
