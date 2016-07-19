//
//  XCFEvents.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFEvents: NSObject {
    /** 是否被推广 */
    var is_promoted:NSNumber?
    /** （推广专题?）id */
    var ID:String?
    /** （推广专题?）标题 */
    var name:String?
    /** （推广专题?）作者 */
    var author:String?
    
    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
}
