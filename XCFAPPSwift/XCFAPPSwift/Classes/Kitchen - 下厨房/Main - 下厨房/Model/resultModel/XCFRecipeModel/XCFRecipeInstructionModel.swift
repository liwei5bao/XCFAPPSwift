//
//  XCFRecipeInstructionModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//  菜谱制作的步骤

import UIKit

class XCFRecipeInstructionModel: NSObject {
    /** 图片地址 */
    var url:String?
    /** 文字描述 */
    var text:String?
    /** 步骤 */
    var step:NSNumber?
    /** 标识（图片名字） */
    var ident:String?
    
    /** 步骤cellHeight */
    var cellHeight:CGFloat?
}
