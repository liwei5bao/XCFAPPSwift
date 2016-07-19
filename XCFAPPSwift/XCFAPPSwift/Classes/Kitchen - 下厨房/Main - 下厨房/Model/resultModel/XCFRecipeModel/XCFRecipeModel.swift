//
//  XCFRecipeModel.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//  菜谱的model

import UIKit

class XCFRecipeModel: NSObject {
    ///菜谱制作步骤介绍数组
    var instruction:NSArray?
    ///菜谱用料数组
    var ingredient:NSArray?
    ///菜谱状态
    var stats:XCFRecipeStatsModel?
    ///作品作者数组
    var dish_author:NSArray?
    ///菜谱作者
    var author:XCFKitchenAuthorModel?
    
    ///视频地址
    var video_url:String?
    ///视频页面url
    var video_page_url:String?
    ///friend创建时间
    var friendly_create_time:String?
    ///创建时间
    var create_time:String?
    ///是否为独家
    var is_exclusive:NSNumber?
    ///菜谱id
    var ID:String?
    ///分数
    var score:String?
    ///小贴士(有则显示)
    var tips:String?
    ///一键购买url（直接跳转
    var purchase_url:String?
    ///菜谱url
    var url:String?
    ///菜谱描述
    var desc:String?
    ///菜谱简述
    var summary:String?
    ///标识（图片名字）
    var ident:String?
    ///菜谱标题
    var name:String?
    ///缩略图
    var thumb:String?
    ///菜谱图片
    var photo:String?
    var photo80:String?
    var photo90:String?
    var photo140:String?
    var photo280:String?
    var photo340:String?
    var photo526:String?
    var photo580:String?
    var photo640:String?
    
    /** 菜谱headerHeight */
    var  headerheight:CGFloat?
    
    
    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
    
    override class func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["instruction":XCFRecipeInstructionModel.self,"ingredient":XCFRecipeIngredient.self,"dish_author":XCFKitchenAuthorModel.self]
    }
}
