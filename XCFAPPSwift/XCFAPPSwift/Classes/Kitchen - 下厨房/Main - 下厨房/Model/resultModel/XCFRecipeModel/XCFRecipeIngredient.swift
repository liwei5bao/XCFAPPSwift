//
//  XCFRecipeIngredient.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFRecipeIngredient: NSObject {
    /** 名称 */
    var name:String?
    /** 用量 */
    var amount:String?
    var cat:String?
    
    /** 选中状态 */
    var state:NSNumber?
    
    /** 用料cellHeight */
    var cellHeight:CGFloat?
}
