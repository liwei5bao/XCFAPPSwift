//
//  XCFRecipeList.swift
//  XCFAPPSwift
//
//  Created by kouclo on 16/7/19.
//  Copyright © 2016年 liwei. All rights reserved.
//

import UIKit

class XCFRecipeList: NSObject {
    /** 菜单作者 */
    var author:XCFKitchenAuthorModel?
    /** 菜谱id数组 */
    var recipes:NSArray?
    /** 菜谱详情数组 */
    var sample_recipes:NSArray?
    /** 第一个菜谱 */
    var first_recipe:XCFRecipeModel?
    
    /** 创建时间 */
    var create_time:String?
    /** 更新时间 */
    var update_time:String?
    /** 标题 */
    var name:String?
    /** 菜单id */
    var ID:String?
    /** 菜单描述 */
    var desc:String?
    /** 菜单网页url */
    var url:String?
    /** 图片 */
    var photo:String?
    /** 缩略图 */
    var thumbnail:String?
    /** 收藏此菜单的人数 */
    var ncollects:String?
    /** 菜单内菜谱数 */
    var nrecipes:String?
    
    /** 是否由我收集 */
    var collected_by_me:NSNumber?
    /** 未知 */
    var pv:NSNumber?
    
    
    /** 菜单headerHeight */
    var headerheight:CGFloat?
    /** 菜单作者名字承载view宽度 */
    var authorNameViewWidth:CGFloat?
    
    override class func mj_replacedKeyFromPropertyName() -> [NSObject : AnyObject]! {
        return ["ID":"id"]
    }
    
    override class func mj_objectClassInArray() -> [NSObject : AnyObject]! {
        return ["sample_recipes":XCFDishModel.self]
    }
}
